Gem::Specification.new do |gem|
  gem.name          = 'bgs_ext'
  gem.version       = '0.21.2'
  gem.summary       = 'Thin wrapper on top of savon to talk with BGS'
  gem.description   = 'Thin wrapper on top of savon to talk with BGS for external BGS consumers'
  gem.license       = 'CC0' # This work is a work of the US Federal Government,
  #               This work is Public Domain in the USA, and CC0 Internationally

  gem.authors       = 'Charley Stran, Ed Mangimelli & Michael Bastos'
  gem.email         = 'charley.stran@oddball.io'
  gem.homepage      = 'https://github.com/department-of-veterans-affairs/lighthouse-bgs'

  gem.add_runtime_dependency 'httpclient'
  gem.add_runtime_dependency 'nokogiri', '>= 1.13.6'
  # Note, savon updated to 2.13 and it adds these to the request envelope:
  # xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd"
  # xmlns:wsp="http://www.w3.org/ns/ws-policy"
  # xmlns:wsp1_2="http://schemas.xmlsoap.org/ws/2004/09/policy"
  # xmlns:wsam="http://www.w3.org/2007/05/addressing/metadata"
  # xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
  # xmlns:xmlns="http://schemas.xmlsoap.org/wsdl/"
  # The `xmlns:xmlns` one is causing a 500 from BGS
  gem.add_runtime_dependency 'savon', '= 2.12'
  gem.add_development_dependency 'rspec', '~> 3.9.0'
  gem.add_development_dependency 'vcr', '~> 6.0.0'
  gem.add_development_dependency 'webmock', '~> 3.8.3'

  gem.files         = Dir['lib/**/*.rb']
  gem.require_paths = ['lib']
end
