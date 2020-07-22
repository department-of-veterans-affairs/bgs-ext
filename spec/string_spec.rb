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

    context 'single word' do
      it 'capitalizes' do
        expect('hello'.camelize(:upper)).to eq 'Hello'
      end

      it 'uncapitalizes' do
        expect('Hello'.camelize(:lower)).to eq 'hello'
      end

      it 'uncapitalize isn\'t downcase' do
        expect('HELLO'.camelize(:lower)).to eq 'hELLO'
      end

      it 'transformation rules override :upper' do
        expect('hello'.camelize(:upper, /h/ => :hello)).to eq 'hello'
      end

      it 'transformation rules override :lower' do
        expect('HELLO'.camelize(:lower, 'HELLO' => 'BYE')).to eq 'BYE'
      end
    end
  end

  it 'symbol matchers are matched against first before other types of matchers' do
    expect('transaction_id'.camelize(:upper, 'id' => 'X', /id/ => :Y, id: :Z)).to eq 'TransactionZ'
  end

  it 'first matching transformation rule is used' do
    expect('transaction_id'.camelize(:upper, 'id' => 'X', /id/ => :Y)).to eq 'TransactionX'
  end
end
