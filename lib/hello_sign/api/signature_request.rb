module HelloSign
  module Api
    module SignatureRequest
      def signature_request opts
        HelloSign::Resource::SignatureRequest.new self, get("/signature_request#{opts[:signature_request_id]}")
      end

      def signature_request_list
        HelloSign::Resource::SignatureRequest.new get('/signature_request/list')
      end

      #TODO
      def signature_request_send opts
        # opts[:file].map {|f| Faraday::UploadIO.new(f, 'image/jpeg')}
        # HelloSign::Resource::SignatureRequest.new post('/signature_request/send', opt)
      end

      def signature_request_send_with_reusable_form opts
        HelloSign::Resource::SignatureRequest.new post('/signature_request/send_with_reusable_form', :body => opts)
      end

      def signature_request_remind opts
        HelloSign::Resource::SignatureRequest.new post("/signature_request/remind/opts[:signature_request_id]", :body => opts)
      end

      def signature_request_remind opts
        HelloSign::Resource::SignatureRequest.new post("/signature_request/cancel/opts[:signature_request_id]", :body => opts)
      end

      #TODO
      def signature_request_files opts
      end

      # add Deprecated warning here
      def signature_request_final_copy opts
        HelloSign::Resource::SignatureRequest.new get "/signature_request/final_copy/opts[:signature_request_id]"
      end

      #TODO
      def signature_request_create_embeddedCreates
      end

      def signature_request_create_embedded_with_reusable_form opts
        HelloSign::Resource::SignatureRequest.new post('/signature_request/create_embedded_with_reusable_form', :body => opts)
      end
    end
  end
end
