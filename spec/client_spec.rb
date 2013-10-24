require_relative 'spec_helper'

describe Gcapi::Client do
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
