require 'spec_helper'

describe HelloSign::Client do
  describe "#get_account" do
    before do
      stub_get("/account", 'account')
      @account = HelloSign.get_account
    end

    it "should get the correct resource" do
      expect(a_get("/account")).to have_been_made
    end

    it "should return current user account" do
      expect(@account).to be_an HelloSign::ObjectifiedHash
    end
  end

  describe "#create_account" do
    context "when successful request" do
      before do
        stub_post("/account/create", "account")
        @account = HelloSign.create_account :email_address => 'test@example.com', :password => 'secret'
      end

      it "should get the correct resource" do
        body = {:email_address => "test@example.com", :password => "secret"}
        expect(a_post("/account/create").with(:body => body)).to have_been_made
      end

      it "should return information about a created account" do
        expect(@account.email_address).to eql("test@example.com")
      end
    end

    context "when bad request" do
      it "should throw an exception" do
        stub_post("/account/create", "400", 400)
        expect {
          HelloSign.create_account :email_address => "test@example.com", :password => "pass"
        }.to raise_error(HelloSign::Error::BadRequest)
      end
    end
  end
end
