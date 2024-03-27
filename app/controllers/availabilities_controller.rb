class AvailabilitiesController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_availability, only: [:show, :update, :destroy]
  
    def index
      @availabilities = Availability.all
      render json: @availabilities
    end
  
    def show
      render json: @availability
    end
  
    def create
      @availability = Availability.new(availability_params)
      if @availability.save
        render json: @availability, status: :created
      else
        render json: @availability.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @availability.update(availability_params)
        render json: @availability
      else
        render json: @availability.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @availability.destroy
      head :no_content
    end
  
    private
  
    def set_availability
      @availability = Availability.find(params[:id])
    end
  
    def availability_params
      params.require(:availability).permit(:tour_id, :availability_rule_id, :start_time)
    end
  end
  