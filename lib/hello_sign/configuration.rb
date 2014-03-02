module HelloSign
  module Configuration
    DEFAULT_ENDPOINT = 'https://api.hellosign.com'.freeze
    DEFAULT_API_VERSION = 'v3'.freeze
    VALID_OPTIONS_KEYS = [:email_address, :password, :api_key, :user_agent, :end_point, :api_version].freeze


    DEFAULT_USER_AGENT = "Gitlab Ruby Gem #{HelloSign::VERSION}".freeze

    attr_accessor *VALID_OPTIONS_KEYS

    # Sets all configuration options to their default values
    # when this module is extended.
    def self.extended(base)
      base.reset
    end

    # Convenience method to allow configuration options to be set in a block.
    def configure
      yield self
    end

    # Creates a hash of options and their values.
    def options
      VALID_OPTIONS_KEYS.inject({}) do |option, key|
        option.merge!(key => send(key))
      end
    end

    # Resets all configuration options to the defaults.
    def reset
      self.email_address = nil
      self.password = nil
      self.api_key = nil
      self.end_point = DEFAULT_ENDPOINT
      self.api_version = DEFAULT_API_VERSION
      self.user_agent = DEFAULT_USER_AGENT
    end
  end
end
