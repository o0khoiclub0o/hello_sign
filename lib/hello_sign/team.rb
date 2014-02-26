module HelloSign
  module Team

    def team
      get("/team")
    end

    def team_create opts
      post("/team/create", :body => {:opts})
    end

    def team opts
      post("/team", :body => opts)
    end

    def team_destroy opts
      post("/team", :body => opts)
    end

    def team_add_member opts
      post("/team/add_member", :body => opts)
    end

    def team_remote_member opts
      post("/team/add_member", :body => opts)
    end
  end
end
