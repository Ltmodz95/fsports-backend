module Api
  module V1
    class PriceAdjustmentsController < BaseController
      before_action :set_price_adjustment, only: %i[ show update destroy ]

      # GET /api/v1/price_adjustments
      def index
        @price_adjustments = PriceAdjustment.where(product_id: params[:product_id]).includes(first_option: :component, second_option: :component)

        render json: @price_adjustments.to_json(include: {first_option: {only: :name, include: :component}, second_option: {only: :name, include: :component}})
      end

      # GET /api/v1/price_adjustments/1
      def show
        render json: @price_adjustment
      end

      # POST /api/v1/price_adjustments
      def create
        @price_adjustment = PriceAdjustment.new(price_adjustment_params)
        @price_adjustment.product_id = params[:product_id]
        if @price_adjustment.save
          render json: @price_adjustment, status: :created
        else
          render json: @price_adjustment.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/price_adjustments/1
      def update
        if @price_adjustment.update(price_adjustment_params)
          render json: @price_adjustment
        else
          render json: @price_adjustment.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/price_adjustments/1
      def destroy
        @price_adjustment.destroy!
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_price_adjustment
          @price_adjustment = PriceAdjustment.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def price_adjustment_params
          params.require(:price_adjustment).permit(:first_option_id, :second_option_id, :price)
        end
    end
  end
end 