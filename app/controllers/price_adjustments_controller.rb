class PriceAdjustmentsController < ApplicationController
  before_action :set_price_adjustment, only: %i[ show update destroy ]

  # GET /price_adjustments
  def index
    @price_adjustments = PriceAdjustment.all

    render json: @price_adjustments
  end

  # GET /price_adjustments/1
  def show
    render json: @price_adjustment
  end

  # POST /price_adjustments
  def create
    @price_adjustment = PriceAdjustment.new(price_adjustment_params)

    if @price_adjustment.save
      render json: @price_adjustment, status: :created, location: @price_adjustment
    else
      render json: @price_adjustment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /price_adjustments/1
  def update
    if @price_adjustment.update(price_adjustment_params)
      render json: @price_adjustment
    else
      render json: @price_adjustment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /price_adjustments/1
  def destroy
    @price_adjustment.destroy!
  end

  def calculate_product_price
    @price_calculator = PriceCalculator.new(params[:selected_options], params[:product_id])
    render json: { price: @price_calculator.calculate_price }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_price_adjustment
      @price_adjustment = PriceAdjustment.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def price_adjustment_params
      params.expect(price_adjustment: [ :first_option_id, :second_option_id, :price ])
    end
end
