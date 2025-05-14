module Api
  module V1
    class ComponentsController < BaseController
      before_action :set_component, only: %i[ show update destroy ]

      # GET /api/v1/components
      def index
        @components = Component.all

        render json: @components
      end

      # GET /api/v1/components/1
      def show
        render json: @component
      end

      # POST /api/v1/components
      def create
        @component = Component.new(component_params)

        if @component.save
          render json: @component, status: :created, location: api_v1_component_url(@component)
        else
          render json: @component.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/components/1
      def update
        if @component.update(component_params)
          render json: @component
        else
          render json: @component.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/components/1
      def destroy
        @component.destroy!
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_component
          @component = Component.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def component_params
          params.require(:component).permit(:name, :product_id)
        end
    end
  end
end 