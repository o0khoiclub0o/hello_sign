module HelloSign
  module Resource
    class SignatureRequestArray < Array
      attr_reader :page, :num_pages, :num_results, :page_size

      def initialize(hash)
        @page = hash['list_info']['page']
        @num_pages = hash['list_info']['num_pages']
        @num_results = hash['list_info']['num_results']
        @page_size = hash['list_info']['page_size']


        hash['signature_requests'].each do |request|
          self << SignatureRequest.new(request, nil)
        end
      end
    end
  end
end
