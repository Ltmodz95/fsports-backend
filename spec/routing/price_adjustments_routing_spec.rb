require "rails_helper"

RSpec.describe PriceAdjustmentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/price_adjustments").to route_to("price_adjustments#index")
    end

    it "routes to #show" do
      expect(get: "/price_adjustments/1").to route_to("price_adjustments#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/price_adjustments").to route_to("price_adjustments#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/price_adjustments/1").to route_to("price_adjustments#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/price_adjustments/1").to route_to("price_adjustments#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/price_adjustments/1").to route_to("price_adjustments#destroy", id: "1")
    end
  end
end
