# frozen_string_literal: true

module BGS
  # Install a new public method on BGS service for introspecting it during
  # development.
  class Base
    def wsdl
      WSDL.new(client.wsdl)
    end
  end

  # Introspect service description during development.
  class WSDL < SimpleDelegator
    def type_namespaces
      parse_types
      super
    end

    def type_definitions
      parse_types
      super
    end

    def parse_types
      return if !!@types_parsed
      @types_parsed = true

      schemas = parser.sections['types'].first
      return if !schemas

      schemas.element_children.each do |import_schema|
        import = import_schema.element_children.first
        next if import.name != "import"

        schema_uri = URI(import['schemaLocation'])
        schema = fetch_schema(schema_uri)

        import_schema.replace(schema)
      end

      parser.parse_types
    end

    def fetch_schema(schema_uri)
      @document_uri ||= URI(document)

      schema_uri.scheme = @document_uri.scheme
      schema_uri.host = @document_uri.host
      schema_uri.port = @document_uri.port

      resolver =
        Wasabi::Resolver.new(
          schema_uri.to_s,
          request,
          adapter,
        )
      
      text = resolver.resolve
      xml = Nokogiri::XML(text)
      xml.root
    end
  end
end
