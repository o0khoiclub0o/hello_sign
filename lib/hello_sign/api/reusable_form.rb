module HelloSign
  module Api
    module ReusableForm
      def reusable_form opts
        HelloSign::Resource::ReusableForm.new get("/reusable_form#{opts[:reusable_form_id]}")
      end

      def reusable_form_list
        HelloSign::Resource::ReusableForm.new get('/reusable_form/list')
      end

      def reusable_form_add_user opts
        HelloSign::Resource::ReusableForm.new post("/reusable_form/add_user/#{opts[:reusable_form_id]}", opts)
      end

      def reusable_form_remove_user opts
        HelloSign::Resource::ReusableForm.new post("/reusable_form/add_user/#{opts[:reusable_form_id]}", opts)
      end
    end
  end
end
