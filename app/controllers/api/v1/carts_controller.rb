module Api
  module V1
    class CartsController < BaseController
      before_action :set_cart, only: %i[ show update destroy ]

      # GET /api/v1/carts
      def index
        @carts = Cart.all

        render json: @carts
      end

      # GET /api/v1/carts/1
      def show
        render json: @cart
      end

      # POST /api/v1/carts
      def create
        @cart = Cart.new(cart_params)

        if @cart.save
          render json: @cart, status: :created, location: api_v1_cart_url(@cart)
        else
          render json: @cart.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/carts/1
      def update
        if @cart.update(cart_params)
          render json: @cart
        else
          render json: @cart.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/carts/1
      def destroy
        @cart.destroy!
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_cart
          @cart = Cart.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def cart_params
          params.require(:cart).permit()
        end
    end
  end
end 