module HelloSign
  module Resource
    class Account < BaseResource
      def initialize(hash, key='account')
        super
      end

      def templates_left
        @data["quotas"]["templates_left"].to_i
      end

      def documents_left
        @data["quotas"]["documents_left"]
      end

      def api_signature_requests_left
        @data["quotas"]["api_signature_requests_left"]
      end
    end
  end
end
