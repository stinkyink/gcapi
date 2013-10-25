require_relative 'spec_helper'

describe Gcapi::Authentication do

  it "has a default token uri" do
    Gcapi::Authentication::TOKEN_URI.must_equal "https://accounts.google.com/o/oauth2/token"
  end
end
