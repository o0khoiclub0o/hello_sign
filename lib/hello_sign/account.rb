module HelloSign
  module Account
    def account
      get("/account")
    end

    def create_account opts
      post("/account/create", :body => opts)
    end

    def update_account opts
      post("/account", :body => opts)
    end
  end
end
