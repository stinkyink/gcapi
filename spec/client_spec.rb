require_relative 'spec_helper'

describe Gcapi::Client do

  it "has a default shopping uri" do
    Gcapi::Client::SHOPPING_URI.must_equal "https://content.googleapis.com/content/v1/"
  end

  it "has a shopping uri with account" do
    client = Gcapi::Client.new(account_id: 12345)
    client.shopping_account_uri.to_s.must_equal "https://content.googleapis.com/content/v1/12345"
  end

  describe "listing products" do
    before do 
      VCR.insert_cassette "listing products"
      @response = Gcapi::Client.new.get("items/products/generic")
    end

    after do
      VCR.eject_cassette
    end

    it "is successful" do
      assert @response.success?
    end

    it "returns the correct data" do
      assert @response.body.has_key?("feed")
    end
  end
end
