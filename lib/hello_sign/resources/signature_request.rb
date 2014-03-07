module HelloSign
  module Resource
    class Embedded < BaseResource
      def initialize(client, hash, key='signature_request')
        super
      end
    end
  end
end
