module Gcapi
  class Client
    def initialize(env=ENV)
      @config    = JSON.parse(open(ENV.fetch("GCAPI_CONFIG")).read)["web"]
      account_id = env.fetch("GCAPI_ACCOUNT_ID")
      @config.merge!({
        "refresh_token" => env.fetch("GCAPI_REFRESH_TOKEN"),
        "shopping_uri"  => env.fetch("GCAPI_SHOPPING_URI") {
          "https://content.googleapis.com/content/v1/#{account_id}"
        }
      })
    end

    def connection
      Faraday.new(url: config["shopping_uri"]) do |conn|
        conn.request :oauth2, access_token
        conn.response :xml,  :content_type => /\bxml$/
        conn.response :json, :content_type => /\bjson$/
        conn.adapter Faraday.default_adapter
      end
    end

    def auth_connection
      Faraday.new(
        ssl: {verify: false}
      ) do |conn|
        conn.request  :url_encoded
        conn.response :json, :content_type => /\bjson$/
        conn.adapter  Faraday.default_adapter
      end
    end

    # Delegate the verbs methods to connection
    [ :get, :post, :put, :delete, :head ].each do |meth|
      define_method(meth) do |*args|
        begin
          res = connection.public_send(meth, *args)
          if res.status == 401
            raise InvalidToken 
          end
          res
        rescue InvalidToken
          request_new_token
          retry
        end
      end
    end

    def request_new_token
      res = auth_connection.post config["token_uri"], {
        'client_id'     => config["client_id"],
        'client_secret' => config["client_secret"],
        'refresh_token' => config["refresh_token"],
        'grant_type'    => 'refresh_token'
      }
      raise TokenRefreshFailure unless res.success?
      self.access_token = res.body["access_token"]
    end

    private
    attr_accessor :access_token
    attr_reader :config
  end

  class InvalidToken < StandardError; end;
  class TokenRefreshFailure < StandardError; end;
end
