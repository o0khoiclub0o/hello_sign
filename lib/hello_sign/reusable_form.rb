module HelloSign
  module ReusableForm
    def reusable_form opts
      get("/reusable_form#{opts[:reusable_form_id]}")
    end

    def reusable_form_list
      get('/reusable_form/list')
    end

    def reusable_form_add_user opts
      post("/reusable_form/add_user/#{opts[:reusable_form_id]}", opts)
    end

    def reusable_form_remove_user opts
      post("/reusable_form/add_user/#{opts[:reusable_form_id]}", opts)
    end
  end
end
