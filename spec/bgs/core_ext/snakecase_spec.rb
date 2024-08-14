# frozen_string_literal: true

require 'bgs/core_ext/blank'

describe String do
  context '#snakecase' do
    it 'correctly applies the case' do
      expect('CamelCase'.snakecase).to eq 'camel_case'
      expect('CamelCase'.underscore).to eq 'camel_case'
    end
  end
end
