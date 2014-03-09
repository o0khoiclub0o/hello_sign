module HelloSign
  module Resource
    class BaseResource
      def initialize(hash, key=nil)
        hash = key ? hash[key] : hash
        @data = hash.inject({}) do |data, (key,value)|
          value = BaseResource.new(value) if value.is_a? Hash
          data[key.to_s] = value
          data
        end
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
