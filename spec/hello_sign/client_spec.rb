require 'spec_helper'

require 'hello_sign'
require 'hello_sign/client'

describe HelloSign::Client do
  describe "#initialize" do
    context "with default values" do
      subject(:client){HelloSign::Client.new}
      HelloSign::Configuration::VALID_OPTIONS_KEYS.each do |key|
        it "should set #{key}" do
          expect(client.send(key)).to eql(HelloSign.send(key))
        end
      end
    end
    context "with custom values" do
      let(:custom_client){
        {
          :email_address => "email_address",
          :password => "password",
          :api_key => "api_key",
          :user_agent => "user_agent",
          :end_point => "end_point",
          :api_version => "api_version"
        }
      }
      subject(:client){ HelloSign::Client.new custom_client}
      HelloSign::Configuration::VALID_OPTIONS_KEYS.each do |key|
        it "should set #{key}" do
          expect(client.send(key)).to eql(custom_client[key])
        end
      end
    end
  end
end
