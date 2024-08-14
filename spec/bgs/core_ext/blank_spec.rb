# frozen_string_literal: true

require 'bgs/core_ext/blank'

describe 'core_ext' do
  context '#blank?' do
    it 'correctly returns true/false' do
      expect(Object.new.blank?).to be false

      expect(nil.blank?).to be true

      expect(false.blank?).to be true
      expect(true.blank?).to be false

      expect('string'.blank?).to be false
      expect(''.blank?).to be true

      expect([].blank?).to be true
      expect(['item'].blank?).to be false

      expect({}.blank?).to be true
      expect({ item: true }.blank?).to be false

      expect(0.blank?).to be false
      expect(100.blank?).to be false
    end
  end
end
