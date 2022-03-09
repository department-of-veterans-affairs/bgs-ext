source 'https://rubygems.org'
gemspec

gem 'rake'

group :development, :test do
  gem 'bundler-audit', git: 'https://github.com/rubysec/bundler-audit'
  gem 'byebug'
  gem 'pry'
  gem 'rspec'
  gem 'rubocop'
  gem 'rubocop-rake'
  gem 'rubocop-rspec'
  gem 'rubocop-thread_safety'
end

group :test do
  gem 'rspec_junit_formatter'
  gem 'rubocop-junit-formatter'
  gem 'simplecov', require: false
  gem 'vcr'
  gem 'webmock'
end
