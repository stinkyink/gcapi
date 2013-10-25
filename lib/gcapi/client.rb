module Gcapi
  class Client
    SHOPPING_URI = "https://content.googleapis.com/content/v1/"

    def initialize(options={})
      @access_token = options.fetch(:access_token, '')
      @account_id   = options.fetch(:account_id, '').to_s
    end

    def shopping_account_uri
      URI.join(SHOPPING_URI, account_id)
    end

    def connection
      Faraday.new(url: shopping_account_uri) do |conn|
        conn.request :oauth2, access_token
        conn.response :xml,  :content_type => /\bxml$/
        conn.response :json, :content_type => /\bjson$/
        conn.adapter Faraday.default_adapter
      end
    end

    # Delegate the verbs methods to connection
    [ :get, :post, :put, :delete, :head ].each do |meth|
      define_method(meth) do |*args|
        begin
          res = connection.public_send(meth, *args)
          raise InvalidToken if res.status == 401
          res
        rescue InvalidToken
          self.access_token = Authentication.new.request_new_token
          retry
        end
      end
    end

    private
    attr_accessor :access_token, :account_id
  end
end
