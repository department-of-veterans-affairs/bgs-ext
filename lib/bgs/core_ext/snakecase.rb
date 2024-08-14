# frozen_string_literal: true

class String
  def snakecase
    # Convert CamelCase to snake_case
    gsub('::', '/')
      .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
      .gsub(/([a-z\d])([A-Z])/, '\1_\2')
      .tr('-', '_')
      .downcase
  end

  # add alias #underscore, as that is the proper/new active_support method name
  alias underscore snakecase
end