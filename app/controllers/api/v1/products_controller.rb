module Api
  module V1
    class ProductsController < BaseController
      before_action :set_product, only: %i[ show update destroy ]

      # GET /api/v1/products
      def index
        @products = Product.all
        if params[:category_id].present?
          @products = @products.where(category_id: params[:category_id])
        end
        render json: @products
      end

      # GET /api/v1/products/1
      def show
        render json: @product.to_json(include: {components: {include: :options}})
      end

      # POST /api/v1/products
      def create
        @product = Product.new(product_params)

        if @product.save
          render json: @product, status: :created, location: api_v1_product_url(@product)
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      end

      def calculate_product_price
        @price_calculator = PriceCalculator.new(params[:selected_options], params[:product_id])
        render json: { total: @price_calculator.calculate_price[0], adjustments: @price_calculator.calculate_price[1] }
      end

      # PATCH/PUT /api/v1/products/1
      def update
        if @product.update(product_params)
          render json: @product
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/products/1
      def destroy
        @product.destroy!
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_product
          @product = Product.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def product_params
          params.require(:product).permit(:name, :base_price, :in_stock, :description, :category_id)
        end
    end
  end
end 