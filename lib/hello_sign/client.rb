require 'hello_sign/objectified_hash'
require 'hello_sign/configuration'
require 'hello_sign/connection'
require 'hello_sign/account'
require 'hello_sign/signature_request'
require 'hello_sign/reusable_form'
require 'hello_sign/team'
require 'hello_sign/unclaimed_draft'
require 'hello_sign/embedded'

module HelloSign
  class Client < Connection
    include Configuration
    include Account
    include SignatureRequest
    include ReusableForm
    include Team
    include UnclaimedDraft
    include Embedded

    def initialize(opts={})
      options = HelloSign.options.merge(opts)
      HelloSign::Configuration::VALID_OPTIONS_KEYS.each do |key|
        self.send("#{key}=", options[key])
      end
    end
  end
end
