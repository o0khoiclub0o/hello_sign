module HelloSign
  class Client
    include Connection
    ENDPOINT = 'https://api.hellosign.com'
    API_VERSION = 'v3'

    def initialize(opts)
      set_request_defaults ENDPOINT, API_VERSION, opts[:email_address], opts[:password]
    end

    def account
      get("/account")
    end
  end
end
