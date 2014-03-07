require 'hello_sign/configuration'
require 'hello_sign/connection'
require 'hello_sign/resources/base_resource'
require 'hello_sign/api/account'
require 'hello_sign/api/signature_request'
require 'hello_sign/api/reusable_form'
require 'hello_sign/api/team'
require 'hello_sign/api/unclaimed_draft'
require 'hello_sign/api/embedded'

module HelloSign
  class Client < Connection
    include Configuration
    include Api::Account
    include Api::SignatureRequest
    include Api::ReusableForm
    include Api::Team
    include Api::UnclaimedDraft
    include Api::Embedded

    def initialize(opts={})
      options = HelloSign.options.merge(opts)
      HelloSign::Configuration::VALID_OPTIONS_KEYS.each do |key|
        self.send("#{key}=", options[key])
      end
    end
  end
end
