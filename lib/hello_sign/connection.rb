require 'faraday'
require 'multi_json'

module HelloSign
  # @private
  module Connection

    def get(path, options={})
      validate request(path, :get, options)
    end

    def post(path, options={})
      validate request(path, :post, options)
    end

    def put(path, options={})
      validate request(path, :put, options)
    end

    def delete(path)
      validate request(path, :delete)
    end

    def request(path, method, options={})
      connection do |faraday|
        faraday.basic_auth @email_address, @password unless options[:no_auth]
      end.send method do |request|
        request.url  "#{@api_version}#{path}", options[:params]
        request.body = options[:body]
      end
    end

    def connection
      Faraday.new(:url => @endpoint, headers: {user_agent: "HelloSign Ruby SDK"}) do |faraday|
        yield faraday
        faraday.request  :url_encoded
        faraday.response :logger
        faraday.adapter  Faraday.default_adapter
      end
    end

    def validate(response)
      case response.status
        when 400; raise Error::BadRequest.new error_message(response)
        when 401; raise Error::Unauthorized.new error_message(response)
        when 403; raise Error::Forbidden.new error_message(response)
        when 404; raise Error::NotFound.new error_message(response)
        when 405; raise Error::MethodNotAllowed.new error_message(response)
        when 409; raise Error::Conflict.new error_message(response)
        when 500; raise Error::InternalServerError.new error_message(response)
        when 502; raise Error::BadGateway.new error_message(response)
        when 503; raise Error::ServiceUnavailable.new error_message(response)
      end
      ObjectifiedHash.new MultiJson.load(response.body)
    end

    def set_request_defaults(endpoint, api_version, email_address, password)
      raise Error::MissingCredentials.new("Please set an endpoint to API") unless endpoint
      raise Error::MissingCredentials.new("Please set a api_version") unless api_version
      raise Error::MissingCredentials.new("Please set a user email_address") unless email_address
      raise Error::MissingCredentials.new("Please set a password") unless password

      @endpoint = endpoint
      @api_version = api_version
      @email_address = email_address
      @password = password
      binding.pry
    end

    private

    def error_message(response)
      binding.pry
      "Server responded with code #{response.status}" \
      "Request URI: #{response.to_hash[:url].to_s}"
    end
  end
end
