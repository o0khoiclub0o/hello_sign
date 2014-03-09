module HelloSign
  module Api
    module Embedded
      def embedded_sign_url opts
        HelloSign::Resource::Embedded.new get("/embedded/sign_url/#{opts[:signature_id]}")
      end
    end
  end
end
