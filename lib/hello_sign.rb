require 'hello_sign/version'
require 'hello_sign/objectified_hash'
require 'hello_sign/error'
require 'hello_sign/connection'

require 'hello_sign/client'

module HelloSign

  def self.email_address=(value)
    @email_address ? CredentialsAlreadySet.new('Password have already set') : @email_address = value
  end

  def self.password=(value)
    @password ? CredentialsAlreadySet.new('Password have already set') : @password = value
  end

  def self.email_address
    @email_address
  end

  def self.password
    @password
  end

  def self.client
    @client ||= HelloSign::Client.new(:email_address => self.email_address, :password => self.password)
  end

  def self.configure
    yield self
    self
  end
end
