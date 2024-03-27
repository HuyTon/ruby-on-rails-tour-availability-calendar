class AvailabilityRulesController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_availability_rule, only: [:show, :update, :destroy]
  
    def index
      @availability_rules = AvailabilityRule.all
      render json: @availability_rules
    end
  
    def show
      render json: @availability_rule
    end
  
    def create
      @availability_rule = AvailabilityRule.new(availability_rule_params)
      if @availability_rule.save
        render json: @availability_rule, status: :created
      else
        render json: @availability_rule.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @availability_rule.update(availability_rule_params)
        render json: @availability_rule
      else
        render json: @availability_rule.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @availability_rule.destroy
      head :no_content
    end
  
    private
  
    def set_availability_rule
      @availability_rule = AvailabilityRule.find(params[:id])
    end
  
    def availability_rule_params
      permitted_params = params.require(:availability_rule).permit(:rule_type, rule_data: {})

      # Permit additional nested parameters based on rule_type
      case permitted_params[:rule_type]
      when "specific_dates"
        permitted_params[:rule_data].permit(dates: [])
      when "weekly"
        permitted_params[:rule_data].permit(days: [], week_number: [])
      when "monthly"
        permitted_params[:rule_data].permit(day_of_month: [], week_number: [])
      # Add more cases for other rule types as needed
      else
        permitted_params[:rule_data].permit(:custom_criteria)
      end
    end
  end
  