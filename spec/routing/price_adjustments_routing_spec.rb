require "rails_helper"

RSpec.describe Api::V1::PriceAdjustmentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/v1/price_adjustments").to route_to("api/v1/price_adjustments#index")
    end

    it "routes to #show" do
      expect(get: "/api/v1/price_adjustments/1").to route_to("api/v1/price_adjustments#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/api/v1/price_adjustments").to route_to("api/v1/price_adjustments#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/v1/price_adjustments/1").to route_to("api/v1/price_adjustments#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/v1/price_adjustments/1").to route_to("api/v1/price_adjustments#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/v1/price_adjustments/1").to route_to("api/v1/price_adjustments#destroy", id: "1")
    end
  end
end
