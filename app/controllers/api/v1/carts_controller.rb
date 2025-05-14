module Api
  module V1
    class CartsController < BaseController
      before_action :set_cart, only: %i[ show]
      # GET /api/v1/carts/1
      def show
        cart_items = @cart.cart_items.includes(:product)
        total_price =0
        debugger
        cart_items.each do |item| 
          total_price += item.selected_options.present?  ?  PriceCalculator.new(JSON.parse(item.selected_options).map(&:first), item.product.id).calculate_price[0] : item.product.base_price
        end 
        render json: {
          items: cart_items.as_json(
            include: [:product],
            methods: [:total_price]
          ),
          total_price: total_price
        }
      end
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_cart
          @cart = Cart.find_by(user: Current.user)
        end
    end
  end
end 