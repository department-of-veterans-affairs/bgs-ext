# frozen_string_literal: true

require 'bgs/string_utils'

describe BGS::StringUtils do
  describe '.camelize' do
    it 'camelizes' do
      expect(
        BGS::StringUtils.camelize 'thE_qUiCk_bRown_foX'
      ).to eq 'ThEQuickBrownFox'
    end

    it 'upper camelizes' do
      expect(
        BGS::StringUtils.camelize 'thE_qUiCk_bRown_foX', :upper
      ).to eq 'ThEQuickBrownFox'
    end

    it 'lower camelizes' do
      expect(
        BGS::StringUtils.camelize 'thE_qUiCk_bRown_foX', :lower
      ).to eq 'thEQuickBrownFox'
    end
  end

  describe '.camelize_but_use_ID_for_id' do
    it 'camelizes' do
      expect(
        BGS::StringUtils.camelize_but_use_ID_for_id 'thE_qUiCk_bRown_foX'
      ).to eq 'ThEQuickBrownFox'
    end

    it 'upper camelizes' do
      expect(
        BGS::StringUtils.camelize_but_use_ID_for_id 'thE_qUiCk_bRown_foX', :upper
      ).to eq 'ThEQuickBrownFox'
    end

    it 'lower camelizes' do
      expect(
        BGS::StringUtils.camelize_but_use_ID_for_id 'thE_qUiCk_bRown_foX', :lower
      ).to eq 'thEQuickBrownFox'
    end

    it 'converts id to ID' do
      expect(
        BGS::StringUtils.camelize_but_use_ID_for_id 'transaction_id'
      ).to eq 'TransactionID'
    end

    it 'converts id to ID even when it\s the first word' do
      expect(
        BGS::StringUtils.camelize_but_use_ID_for_id 'id_transaction_id'
      ).to eq 'IDTransactionID'
    end
  end

  describe '.snake_case_converter' do
    it 'does nothing when only passed a string with no additional params' do
      expect(
        BGS::StringUtils.snake_case_converter('hello_world')
      ).to eq 'hello_world'
    end

    it 'can turn snake case into kebab case' do
      expect(
        BGS::StringUtils.snake_case_converter('testing_1_2_3', '-')
      ).to eq 'testing-1-2-3'
    end

    it 'can transform each word of a snake case string individually' do
      expect(
        BGS::StringUtils.snake_case_converter('ew_evol_ot_nur_edistuo', ' ') do |word|
          word.reverse
        end
      ).to eq 'we love to run outside'
    end

    it 'can treat the first word differently' do
      expect(
        BGS::StringUtils.snake_case_converter('they_evol_ot_nur_edistuo', ' ', proc { |x| x }) do |word|
          word.reverse
        end
      ).to eq 'they love to run outside'
    end

    it 'can treat the first word differently and leave the other words alone' do
      expect(
        BGS::StringUtils.snake_case_converter('please_recycle', '_', proc { |x| x.upcase })
      ).to eq 'PLEASE_recycle'
    end

    it 'can be used to camelize' do
      expect(
        BGS::StringUtils.snake_case_converter('the_quick_brown_fox', '', &:capitalize)
      ).to eq 'TheQuickBrownFox'
      # ^^^ this is close to ActiveSupport's camelize(:upper), but not 100%
      # Technically, ActiveSupport applies different a rule to the first word:
      # ActiveSupport capitalizes words[1..-1]
      # (capitalize is: downcase entire string, upcase first character),
      # and simply upcases the first character of the first word
      # ex: if you swapped 'the_quick_brown_fox' for 'tHe_quick_brown_fox',
      # the camelize implementation above would no longer match ActiveSupport
    end
  end
end

=begin

# you can past the entirety of the BGS::StringUtils module into a Rails console
# and the following code to compare
# BGS::StringUtils.camelize with ActiveSupport's camelize

def compare_active_support_camelize_and_bgs_string_utils_camelize(string)
  active_supports_result = string.camelize
  begin
    bgs_string_utils_result = BGS::StringUtils.camelize(string)
  rescue
    puts "BGS::StringUtils failed!  #{string.inspect}"
    raise
  end

  return if active_supports_result == bgs_string_utils_result

  puts <<~X
    Camelized differently!

    #{string.inspect}
     |
     V
    ActiveSupport: #{active_supports_result} 
    BGS::StringUtils: #{bgs_string_utils_result} 
  X
  raise
end

def test *strings
  strings.each do |string|
    compare_active_support_camelize_and_bgs_string_utils_camelize string
  end
  puts 'SUCCESS!'
end

test 'hello_world',
  'HELLO_WORLD',
  'hElLo_wOrLd',
  'HeLlO_WoRlD',
  '_hello_',
  '',
  '_',
  '___',
  '2ab_623__2',
  'transaction_id',
  'TransactionId',
  'TransactionID',
  '_hello___world__hi_'

=end
