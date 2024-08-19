# frozen_string_literal: true

describe String do
  context '#snakecase' do
    it 'correctly applies the case' do
      expect('CamelCase'.snakecase).to eq 'camel_case'
    end
  end
end
