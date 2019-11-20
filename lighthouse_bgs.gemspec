Gem::Specification.new do |gem|
  gem.name          = 'lighthouse_bgs'
  gem.version       = '0.4.0'
  gem.summary       = 'Thin wrapper on top of savon to talk with BGS'
  gem.description   = 'Thin wrapper on top of savon to talk with BGS'
  gem.license       = 'CC0' # This work is a work of the US Federal Government,
  #               This work is Public Domain in the USA, and CC0 Internationally

  gem.authors       = 'Charley Stran'
  gem.email         = 'charley.stran@oddball.io'
  gem.homepage      = ''

  gem.add_runtime_dependency 'httpclient'
  gem.add_runtime_dependency 'nokogiri', '>= 1.8.5'
  gem.add_runtime_dependency 'savon', '~> 2.12'

  gem.files         = Dir['lib/**/*.rb']
  gem.require_paths = ['lib']
end
