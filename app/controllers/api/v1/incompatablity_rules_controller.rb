module Api
  module V1
    class IncompatablityRulesController < BaseController
      before_action :set_incompatablity_rule, only: %i[ show update destroy ]

      # GET /api/v1/incompatablity_rules
      def index
        @incompatablity_rules = IncompatablityRule.where(product_id: params[:product_id]).includes(first_option: :component, second_option: :component)

      render json: @incompatablity_rules.to_json(include: {first_option: {only: :name, include: :component}, second_option: {only: :name, include: :component}})
      end

      # GET /api/v1/incompatablity_rules/1
      def show
        render json: @incompatablity_rule
      end

      # POST /api/v1/incompatablity_rules
      def create
        @incompatablity_rule = IncompatablityRule.new(incompatablity_rule_params)
        @incompatablity_rule.product_id = params[:product_id]
        if @incompatablity_rule.save
          render json: @incompatablity_rule, status: :created
        else
          render json: @incompatablity_rule.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/incompatablity_rules/1
      def update
        if @incompatablity_rule.update(incompatablity_rule_params)
          render json: @incompatablity_rule
        else
          render json: @incompatablity_rule.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/incompatablity_rules/1
      def destroy
        @incompatablity_rule.destroy!
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_incompatablity_rule
          @incompatablity_rule = IncompatablityRule.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def incompatablity_rule_params
          params.require(:incompatablity_rule).permit(:first_option_id, :second_option_id)
        end
    end
  end
end 