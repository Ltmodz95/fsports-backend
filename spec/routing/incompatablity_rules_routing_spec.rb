require "rails_helper"

RSpec.describe IncompatablityRulesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/incompatablity_rules").to route_to("incompatablity_rules#index")
    end

    it "routes to #show" do
      expect(get: "/incompatablity_rules/1").to route_to("incompatablity_rules#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/incompatablity_rules").to route_to("incompatablity_rules#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/incompatablity_rules/1").to route_to("incompatablity_rules#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/incompatablity_rules/1").to route_to("incompatablity_rules#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/incompatablity_rules/1").to route_to("incompatablity_rules#destroy", id: "1")
    end
  end
end
