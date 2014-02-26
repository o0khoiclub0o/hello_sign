module HelloSign
  module Embedded
    def embedded_sign_url opts
      get "embedded/sign_url/#{opts[:signature_id]}"
    end
  end
end
