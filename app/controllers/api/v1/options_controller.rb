module Api
  module V1
    class OptionsController < BaseController
      before_action :set_option, only: %i[ show update destroy ]

      # GET /api/v1/options
      def index
        @options = Option.all

        render json: @options
      end

      # GET /api/v1/options/1
      def show
        render json: @option
      end

      # POST /api/v1/options
      def create
        @option = Option.new(option_params)

        if @option.save
          render json: @option, status: :created, location: api_v1_option_url(@option)
        else
          render json: @option.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/options/1
      def update
        if @option.update(option_params)
          render json: @option
        else
          render json: @option.errors, status: :unprocessable_entity
        end
      end

      def check_compatibility
        @compatibility = OptionsCompatiblity.new(params[:selected_options])
        if @compatibility.compatible?
          render json: []
        else
          render json: @compatibility.incompatible_combinations
        end
      end

      # DELETE /api/v1/options/1
      def destroy
        @option.destroy!
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_option
          @option = Option.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def option_params
          params.require(:option).permit(:name, :price, :in_stock, :component_id)
        end
    end
  end
end 