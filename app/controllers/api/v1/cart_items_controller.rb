module Api
  module V1
    class CartItemsController < BaseController
      before_action :set_cart_item, only: %i[ show update destroy ]

      # GET /api/v1/cart_items
      def index
        @cart_items = CartItem.all

        render json: @cart_items
      end

      # GET /api/v1/cart_items/1
      def show
        render json: @cart_item
      end

      # POST /api/v1/cart_items
      def create
        @cart_item = ::CreateCartItem.new(params[:product_id], params[:selected_options]).call
        if @cart_item.save!
          render json: @cart_item, status: :created
        else
          render json: @cart_item.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/cart_items/1
      def update
        if @cart_item.update(cart_item_params)
          render json: @cart_item
        else
          render json: @cart_item.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/cart_items/1
      def destroy
        @cart_item.destroy!
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_cart_item
          @cart_item = CartItem.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def cart_item_params
          params.permit(:product_id, :selected_options)
        end
    end
  end
end 