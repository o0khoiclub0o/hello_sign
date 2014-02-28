require 'spec_helper'

require 'hello_sign/client'

describe HelloSign::Client do

  context "initialize" do
    let(:client) do
      HelloSign::Client.new(
        :email_address => 'email_address',
        :password => 'password',
      )
    end

    it "is configurable" do
      client.email_address.should eq('email_address')
      client.password.should eq('password')
    end
  end
end
