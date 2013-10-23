module Gcapi
  class Client
    def initialize(env=ENV)
      @account_id       = env.fetch("GCAPI_ACCOUNT_ID")
      @access_token     = env.fetch("GCAPI_TOKEN")
      @refresh_token    = env.fetch("GCAPI_REFRESH")
      @url              = env.fetch("GCAPI_URL") {
        "https://content.googleapis.com/content/v1/#{account_id}"
      }
    end

    def connection
      @connection ||= Faraday.new(url: url) do |conn|
        conn.request :oauth2, access_token
        conn.response :xml
        conn.adapter Faraday.default_adapter
      end
    end

    # Delegate the verbs methods to connection
    #[ :get, :post, :put, :delete, :head ].each do |meth|
      #define_method(meth) do |*args|
        #res = connection.public_send(meth, *args)
      #end
    #end

    private
    attr_reader :account_id, :access_token, :refresh_token, :url
  end
end
