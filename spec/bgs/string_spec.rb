# frozen_string_literal: true

require 'bgs/string'

describe BGS::String do
  describe '#camelize' do
    subject { described_class.new('hello_world') }

    it 'camelizes' do
      expect(subject.camelize).to eq 'HelloWorld'
    end

    it 'camelizes uppercase' do
      expect(subject.camelize(:upper)).to eq 'HelloWorld'
    end

    it 'camelizes lowercase' do
      expect(subject.camelize(:lower)).to eq 'helloWorld'
    end

    it 'camelizes a single word' do
      expect(described_class.new('hi').camelize(:upper)).to eq 'Hi'
    end
  end

  describe '#to_bgs_key' do
    it 'changes id to ID' do
      expect(described_class.new('transaction_id').to_bgs_key).to eq 'TransactionID'
    end

    it 'changes id to ID even when it\'s the first word' do
      expect(described_class.new('id_for_transactions').to_bgs_key(:lower)).to eq 'IDForTransactions'
    end
  end
end
