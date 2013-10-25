require "json"

require "faraday"
require "faraday_middleware"
require "gem_config"

require "gcapi/version"
require "gcapi/exceptions"
require "gcapi/authentication"
require "gcapi/client"

module Gcapi
  include GemConfig::Base

  with_configuration do
    has :client_id
    has :client_secret
    has :account_id
    has :refresh_token
    has :dry_run, values: [true, false], default: false
    has :shopping_uri, 
        default: "https://content.googleapis.com/content/v1"
    has :token_uri, 
        default: "https://accounts.google.com/o/oauth2/token"
  end
end
