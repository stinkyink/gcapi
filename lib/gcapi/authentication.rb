module Gcapi
  class Authentication
    TOKEN_URI = "https://accounts.google.com/o/oauth2/token"

    def initialize(options={})
      @client_id     = options.fetch(:client_id, Gcapi.configuration.client_id)
      @client_secret = options.fetch(:client_secret, Gcapi.configuration.client_secret)
      @refresh_token = options.fetch(:refresh_token, Gcapi.configuration.refresh_token)
    end

    def request_new_token
      res = connection.post TOKEN_URI, {
        'client_id'     => client_id,
        'client_secret' => client_secret,
        'refresh_token' => refresh_token,
        'grant_type'    => 'refresh_token'
      }
      raise TokenRefreshFailure unless res.success?
      res.body["access_token"]
    end

    private
    attr_reader :client_id, :client_secret, :refresh_token

    def connection
      Faraday.new(
        ssl: {verify: false}
      ) do |conn|
        conn.request  :url_encoded
        conn.response :json, :content_type => /\bjson$/
        conn.adapter  Faraday.default_adapter
      end
    end
  end
end
