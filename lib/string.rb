# frozen_string_literal: true

# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

class String
  CAMELIZE_MODES = %i[upper lower].freeze
  DEFAULT_CAMELIZE_MODE = :upper

  # simplified version of ActiveSupport's camelize method
  # first arg is mode; either :upper or :lower, just like ActiveSupport. (optional)
  #
  # after the first arg, special transformation rules can be specified as key and value
  #
  # examples:
  # 
  #   'hello_there'.camelize # 'HelloThere'
  #   'hello_there'.camelize(:lower) # 'helloThere'
  #   'hello_there'.camelize(:upper) # 'HelloThere'
  # 
  #  transformation rules:  matcher => replacement
  #
  #   'the_cat_sweater'.camelize(:upper, 'cat' => 'Dog') # 'TheDogSweater'
  #
  #  symbols get converted to strings
  #
  #   'the_cat_sweater'.camelize(:upper, cat: :Dog) # 'TheDogSweater'
  #
  #  watch out for the case
  #
  #   'the_cat_sweater'.camelize(:upper, 'cat' => 'dog') # 'ThedogSweater'
  #   'the_cat_sweater'.camelize(:upper, Cat: :Dog) # 'TheCatSweater' ('Cat' didn't match 'cat')
  # 
  #  matchers can be Regexp
  #
  #   'transaction_iD'.camelize(:lower, /id/i => :ID) # 'transactionID'
  # 
  #  NOTE: a transformation rule overrides :upper or :lower
  #
  #   'hello_there'.camelize(:upper, 'hello' => 'hi') # hiThere (notice it's not 'HiThere')

  def camelize(mode = DEFAULT_CAMELIZE_MODE, special_rules = {})
    camelize__validate_mode mode
    special_rules = camelize__validate_and_normalize_special_rules special_rules

    words = split('_')

    was_transformed_with_special_rule = []

    transformed_words = words.map do |word|
      _, replacement = special_rules.find do |matcher, _|
        matcher === word
      end
      was_transformed_with_special_rule << !!replacement
      replacement || word.capitalize
    end

    return transformed_words.join('') if was_transformed_with_special_rule.first || mode == :upper

    [words.first.uncapitalize, *transformed_words[1..-1]].join('')
  end

  def uncapitalize
    self[0, 1].downcase + self[1..-1]
  end

  private

  def camelize__validate_mode(mode)
    return if CAMELIZE_MODES.include? mode

    raise ArgumentError, "unrecognized mode: #{mode.inspect}. mode must be one of #{CAMELIZE_MODES}"
  end

  def camelize__validate_and_normalize_special_rules(special_rules)
    raise ArgumentError, 'second arg to camelize must be a hash' unless special_rules.is_a? Hash

    special_rules.reduce({}) do |acc, (matcher, replacement)|
      case matcher
      when Regexp, String
        acc.merge({ matcher => replacement.to_s })
      when Symbol
        acc.merge({ matcher.to_s => replacement.to_s })
      else
        raise
      end
    rescue StandardError
      raise(
        ArgumentError,
        'Special rules must be: String|Symbol|Regexp => StringableThing. Not ' \
        "#{matcher.class} => #{replacement.class}"
      )
    end
  end
end
