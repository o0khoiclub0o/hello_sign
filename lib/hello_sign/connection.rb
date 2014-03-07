require 'faraday'
require 'multi_json'
require 'hello_sign/error'
require 'pry'
module HelloSign
  # @private
  class Connection

    def end_point; end;
    def api_version; end;
    def user_agent; end;
    def email_address; end;
    def password; end;
    def api_key; end;

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
      faraday = connection
      unless options[:no_auth]
        if email_address
          faraday.basic_auth email_address, password
        elsif api_key
          faraday.basic_auth api_key, ''
        else
          #error
        end
      end
      faraday.send method do |request|
        request.url  "#{api_version}#{path}", options[:params]
        request.body = options[:body]
      end
    end


    def connection
      Faraday.new(faraday_options) do |faraday|
        faraday.request  :multipart
        faraday.request  :url_encoded
        faraday.response :logger
        faraday.adapter  :net_http
      end
    end

    def faraday_options
      {url: end_point, headers: {user_agent: user_agent}}
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
      MultiJson.load(response.body)
    end

    private
    def error_message(response)
      "Server responded with code #{response.status}" \
      "Request URI: #{response.to_hash[:url].to_s}"
    end
  end
end
