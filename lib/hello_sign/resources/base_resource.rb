module HelloSign
  module Resource
    class BaseResource
      def initialize(client, hash, key=nil)
        @client = client
        @data = key ? hash[key] : hash
      end

      def data
        @data
      end

      def method_missing(key)
        @data.key?(key.to_s) ? @data[key.to_s] : nil
      end
    end
  end
end
