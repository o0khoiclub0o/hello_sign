require 'hello_sign/version'
require 'hello_sign/configuration'
require 'hello_sign/client'

module HelloSign
  extend Configuration

  def self.client(options={})
    HelloSign::Client.new(options)
  end

  # Delegate to HelloSign::Client
  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)
    client.send(method, *args, &block)
  end

  # Delegate to HelloSign::Client
  def self.respond_to?(method)
    return super || client.respond_to?(method)
  end
end
