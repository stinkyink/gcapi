# Gcapi

Unofficial Wrapper for the Google Content for Shopping API

Definately ALPHA quality

## Installation

Add this line to your application's Gemfile:

    gem 'gcapi'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gcapi

## Configuration

```ruby
# config/initializers/datacash.rb
Gcapi.configure do |config|
  config.client_id = "123456"
  config.client_secret = "password1234"
  config.refresh_token = "tokenABC"
end
# or
Gcapi.configuration.client_id = "123456"
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
