# frozen_string_literal: true

module BGS
  class String < SimpleDelegator
    DEFAULT_CAMELIZE_MODE = :upper

    # almost ActiveSupport's camelize
    # --doesn't convert '/' to '::', and doesn't use inflectors
    def camelize(mode = DEFAULT_CAMELIZE_MODE)
      method_to_use_for_first_word = validate_camelize_mode(mode)
      transform_snake_case(method_to_use_for_first_word.to_proc, :upcase_first_character.to_proc)
    end

    def camelcase(mode = DEFAULT_CAMELIZE_MODE)
      camelize mode
    end

    def to_bgs_key(mode = DEFAULT_CAMELIZE_MODE)
      camelize_but_use_ID_for_id mode
    end

    def camelize_but_use_ID_for_id(mode = DEFAULT_CAMELIZE_MODE)
      method_to_use_for_first_word = validate_camelize_mode(mode)

      transform_snake_case(
        proc { |w| w.to_ID || w.send(method_to_use_for_first_word) },
        proc { |w| w.to_ID || w.upcase_first_character }
      )
    end

    def transform_snake_case(proc_for_the_first_word, proc_for_the_rest = proc_for_the_first_word)
      words = split('_').map { |w| self.class.new w }
      [
        proc_for_the_first_word.call(words.first),
        *words[1..-1].map(&proc_for_the_rest)
      ].join('')
    end

    def downcase_first_character
      self[0, 1].downcase + self[1..-1]
    end

    def upcase_first_character
      self[0, 1].upcase + self[1..-1]
    end

    def to_ID
      /id/i === self && 'ID'
    end

    private

    def validate_camelize_mode(mode)
      method_to_use_for_first_word = {
        upper: :upcase_first_character,
        lower: :downcase_first_character
      }[mode]
      method_to_use_for_first_word or raise ArgumentError
    end
  end
end
