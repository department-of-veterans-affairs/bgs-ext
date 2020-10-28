# frozen_string_literal: true

# By default run SimpleCov, but allow an environment variable to disable.
unless ENV['NOCOVERAGE']
  require 'simplecov'

  SimpleCov.start do
    track_files '**/{lib}/**/*.rb'
    add_filter "/spec/"

    SimpleCov.minimum_coverage_by_file 45 unless ENV['CIRCLE_JOB']
    SimpleCov.refuse_coverage_drop unless ENV['CIRCLE_JOB']
  end
end

require 'vcr'
require 'webmock/rspec'
require 'bgs'

BGS.configure do |config|
  config.application = 'VAgovAPI'
  config.client_ip = '127.0.0.1'
  config.client_station_id = 281
  config.client_username = 'VAgovAPI'
  config.env = 'linktest'
  config.mock_response_location = '../vets-api-mockdata/bgs'
  config.mock_responses = false
  config.external_uid = 'lighthouse-vets-api'
  config.external_key = 'lighthouse-vets-api'
  config.forward_proxy_url = 'https://localhost:4447'
  config.ssl_verify_mode = 'none'
  # config.log = true
end

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
