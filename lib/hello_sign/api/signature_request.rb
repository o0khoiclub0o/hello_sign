require 'hello_sign/resources/signature_request'
require 'hello_sign/resources/signature_request_array'

module HelloSign
  module Api
    module SignatureRequest
      def get_signature_request opts
        HelloSign::Resource::SignatureRequest.new get("/signature_request/#{opts[:signature_request_id]}")
      end

      def get_signature_requests
        HelloSign::Resource::SignatureRequestArray.new get('/signature_request/list')
      end

      #TODO
      def send_signature_request opts

        opts[:files].each_with_index do |file, index|
          opts[:"file[#{index}]"] = Faraday::UploadIO.new(file, 'image/jpeg')
        end
        opts.delete(:files)

        opts[:signers].each_with_index do |signer, index|
          opts[:"signers[#{index}]"] = signer
        end
        opts.delete(:signers)

        HelloSign::Resource::SignatureRequest.new post('/signature_request/send', :body => opts)
      end

      def send_signature_request_with_reusable_form opts
        HelloSign::Resource::SignatureRequest.new post('/signature_request/send_with_reusable_form', :body => opts)
      end

      def remind_signature_request opts
        HelloSign::Resource::SignatureRequest.new post("/signature_request/remind/#{opts[:signature_request_id]}", :body => opts)
      end

      def cancel_signature_request opts
        post("/signature_request/cancel/#{opts[:signature_request_id]}", :body => opts)
      end


      #TODO
      def signature_request_files opts
        get("/signature_request/files/#{opts[:signature_request_id]}")
      end

      # add Deprecated warning here
      def signature_request_final_copy opts
        HelloSign::Resource::SignatureRequest.new get("/signature_request/final_copy/#{opts[:signature_request_id]}")
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
