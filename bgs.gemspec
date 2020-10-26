Gem::Specification.new do |gem|
  gem.name          = 'bgs_ext'
  gem.version       = '0.15.1'
  gem.summary       = 'Thin wrapper on top of savon to talk with BGS'
  gem.description   = 'Thin wrapper on top of savon to talk with BGS for external BGS consumers'
  gem.license       = 'CC0' # This work is a work of the US Federal Government,
  #               This work is Public Domain in the USA, and CC0 Internationally

  gem.authors       = 'Charley Stran, Ed Mangimelli & Michael Bastos'
  gem.email         = 'charley.stran@oddball.io'
  gem.homepage      = 'https://github.com/department-of-veterans-affairs/lighthouse-bgs'

  gem.add_runtime_dependency 'httpclient'
  gem.add_runtime_dependency 'nokogiri', '>= 1.8.5'
  gem.add_runtime_dependency 'savon', '~> 2.12'
  gem.add_development_dependency 'rspec', '~> 3.9.0'
  gem.add_development_dependency 'vcr', '~> 6.0.0'
  gem.add_development_dependency 'webmock', '~> 3.8.3'

  gem.files         = Dir['lib/**/*.rb']
  gem.require_paths = ['lib']
end
