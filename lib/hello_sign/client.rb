require 'hello_sign/connection'
require 'hello_sign/account'
require 'hello_sign/signature_request'
require 'hello_sign/reusable_form'
require 'hello_sign/team'
require 'hello_sign/unclaimed_draft'
require 'hello_sign/embedded'

module HelloSign
  class Client

    attr_accessor :email_address, :password
    include Connection
    include Account
    include SignatureRequest
    include ReusableForm
    include Team
    include UnclaimedDraft
    include Embedded
    ENDPOINT = 'https://api.hellosign.com'
    API_VERSION = 'v3'

    def initialize(opts)
      set_request_defaults ENDPOINT, API_VERSION, opts[:email_address], opts[:password]
    end
  end
end
