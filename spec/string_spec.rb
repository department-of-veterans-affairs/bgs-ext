# frozen_string_literal: true

require_relative '../lib/string.rb'

describe String do
  describe '#camelize' do
    it 'camelizes' do
      expect('hello_world'.camelize).to eq 'HelloWorld' 
    end

    it 'camelizes uppercase' do
      expect('hello_world'.camelize(:upper)).to eq 'HelloWorld' 
    end

    it 'camelizes lowercase' do
      expect('hello_world'.camelize(:lower)).to eq 'helloWorld' 
    end

    it 'obeys transformation rules' do
      expect('hello_world'.camelize(:lower, hello: :HI)).to eq 'HIWorld' 
    end

    it 'obeys transformation rules' do
      expect('transaction_id'.camelize(:lower, /id/i => 'ID')).to eq 'transactionID' 
    end
  end
end
