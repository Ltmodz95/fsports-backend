class IncompatablityRulesController < ApplicationController
  before_action :set_incompatablity_rule, only: %i[ show update destroy ]

  # GET /incompatablity_rules
  def index
    @incompatablity_rules = IncompatablityRule.all

    render json: @incompatablity_rules
  end

  # GET /incompatablity_rules/1
  def show
    render json: @incompatablity_rule
  end

  # POST /incompatablity_rules
  def create
    @incompatablity_rule = IncompatablityRule.new(incompatablity_rule_params)

    if @incompatablity_rule.save
      render json: @incompatablity_rule, status: :created, location: @incompatablity_rule
    else
      render json: @incompatablity_rule.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /incompatablity_rules/1
  def update
    if @incompatablity_rule.update(incompatablity_rule_params)
      render json: @incompatablity_rule
    else
      render json: @incompatablity_rule.errors, status: :unprocessable_entity
    end
  end

  # DELETE /incompatablity_rules/1
  def destroy
    @incompatablity_rule.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incompatablity_rule
      @incompatablity_rule = IncompatablityRule.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def incompatablity_rule_params
      params.expect(incompatablity_rule: [ :first_option_id, :second_option_id ])
    end
end
