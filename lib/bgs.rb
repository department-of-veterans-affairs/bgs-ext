# frozen_string_literal: true

# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

require 'bgs/base'
require 'bgs/errors'
require 'bgs/services'
require 'bgs/string'

module BGS
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= BGS::Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :client_ip, :application, :client_username,
                  :env, :client_station_id, :jumpbox_url,
                  :ssl_cert_file, :ssl_cert_key_file, :ssl_ca_cert,
                  :log, :mock_responses, :forward_proxy_url,
                  :mock_response_location, :external_uid, :external_key,
                  :ssl_verify_mode

    def initialize; end
  end
end
