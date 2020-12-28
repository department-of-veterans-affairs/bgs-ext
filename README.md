bgs-ext
========

`bgs-ext` is a gem that helps developers granted to be external consumers of the
`BGS` (Benefits Gateway Services) service connect to a set of VA internal benefits related webservices,.


Initial Setup
-------------
create an initializer
```ruby
  BGS.configure do |config|
    config.application = 'APPNAME'
    config.client_ip = '127.0.0.1'
    config.client_station_id = '281'
    config.client_username = 'myusername'
    config.env = 'someenv'
    config.external_uid = 'myuserid'
    config.external_key = 'myexternalkey'
    config.mock_response_location = "#{Rails.root}/../vets-api-mockdata/bgs" # optional
    config.mock_responses = false # optional
    config.ssl_cert_file = 'path_to_cert' # optional
    config.ssl_cert_key_file = 'path_to_key_file' # optional
    config.ssl_ca_cert = 'path_to_ca_cert' # optional
    config.forward_proxy_url = 'forward_proxy_url' # optional
    config.jumpbox_url = 'jumpbox_url' # optional
    config.log = true # optional
  end
```

Example Usage
-------------

```ruby
require 'bgs'

service = BGS::Services.new(
        external_uid: 'something',
        external_key: 'something'
      )
puts service.people.find_by_ssn "9999999999"
```


Testing
-------

You'll need Ruby 2.5.3 if you don't have it.

> $ rbenv install 2.5.3

Install dependencies

> $ gem install bundler --no-rdoc --no-ri
> $ bundle install

Run tests

> $ bundle exec rake spec


Maintenance
-------

Version must be appropriately updated within the bgs.gemspec file when this gem's contract is modified.


License
=======

[The project is in the public domain](LICENSE.md), and all contributions will also be released in the public domain. By submitting a pull request, you are agreeing to waive all rights to your contribution under the terms of the [CC0 Public Domain Dedication](http://creativecommons.org/publicdomain/zero/1.0/).

This project constitutes an original work of the United States Government.
