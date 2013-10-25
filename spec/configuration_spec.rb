require_relative 'spec_helper'

describe Gcapi, 'configuration' do
  it "defaults to dry_run" do
    Gcapi.configuration.dry_run.must_equal true
  end

  it "allows client_id to be set" do
    Gcapi.configuration.client_id = '12345'
    Gcapi.configuration.client_id.must_equal '12345'
  end

  it "allows client_secret to be set" do
    Gcapi.configuration.client_secret = 'abc123'
    Gcapi.configuration.client_secret.must_equal 'abc123'
  end

  it "allows account_id to be set" do
    Gcapi.configuration.account_id = '123abc'
    Gcapi.configuration.account_id.must_equal '123abc'
  end

  it "allows refresh_token to be set" do
    Gcapi.configuration.refresh_token = '1a2b'
    Gcapi.configuration.refresh_token.must_equal '1a2b'
  end
end
