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

## Usage

| Environment Variable     | Description                                              |
|--------------------------|----------------------------------------------------------|
| GCAPI_CONFIG             | OAuth 2.0 Client ID JSON from Google Cloud console       |
| GCAPI_REFRESH_TOKEN      | Create one using ./bin/gcapi-get-token                   |
| GCAPI_ACCOUNT_ID         | Google Shopping Merchant ID                              |
| GCAPI_SHOPPING_URI       | ihttps://content.googleapis.com/content/v1/#{account_id} |


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
