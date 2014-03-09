require 'hello_sign/resources/account'

module HelloSign
  module Api
    module Account
      def get_account
        HelloSign::Resource::Account.new get("/account")
      end

      def create_account opts
        HelloSign::Resource::Account.new post("/account/create", :body => opts)
      end

      def update_account opts
        HelloSign::Resource::Account.new post("/account", :body => opts)
      end
    end
  end
end
