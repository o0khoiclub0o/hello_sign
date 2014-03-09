module HelloSign
  module Api
    module Team

      def team
        HelloSign::Resource::Team.new get("/team")
      end

      def team_create opts
        HelloSign::Resource::Team.new post("/team/create", :body => :opts)
      end

      def team opts
        HelloSign::Resource::Team.new post("/team", :body => opts)
      end

      def team_destroy opts
        HelloSign::Resource::Team.new post("/team", :body => opts)
      end

      def team_add_member opts
        HelloSign::Resource::Team.new post("/team/add_member", :body => opts)
      end

      def team_remote_member opts
        HelloSign::Resource::Team.new post("/team/add_member", :body => opts)
      end
    end
  end
end
