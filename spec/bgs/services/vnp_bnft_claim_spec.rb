# frozen_string_literal: true

require 'bgs'
describe BGS::VnpBnftClaimService do
  describe '.camelize' do
    it 'camelizes but always transforms id to ID' do
      expect(described_class.camelize('test_id')).to eq 'testID'
      expect(described_class.camelize('id_test')).to eq 'IDTest'
    end
  end
end
