class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  def get_availability_tours
    tours = Tour.includes(availabilities: :availability_rule)
                .all
                .as_json(include: { availabilities: { include: :availability_rule } })

    render json: { tours: tours }, status: :ok
  end

  def create_tour_availability
    # Extract input data from params
    tour_params = params.require(:tour).permit(:name, :description, :duration_hours, :duration_days)
    availability_params = params.require(:availability).permit(:start_time)
    availability_rule_params = params.require(:availability_rule).permit(:rule_type, rule_data: {})
  
    if tour_params.blank? || 
       availability_params.blank? || 
       availability_rule_params.blank? ||
       tour_params[:name].blank? || 
       availability_params[:start_time].blank? || 
       availability_rule_params[:rule_type].blank?
       render json: { error: "Failed to create tour" }, status: :unprocessable_entity
       return
    end

    # Permit additional nested parameters based on rule_type
    case availability_rule_params[:rule_type]
    when "specific_dates"
      availability_rule_params[:rule_data].permit(dates: [])
    when "weekly"
      params.require(:availability_rule).permit(:rule_type, rule_data: { days: [] })
    when "monthly"
      params.require(:availability_rule).permit(:rule_type, rule_data: { days_of_month: [], week_numbers: [] })
    # Add more cases for other rule types as needed
    else
      params.require(:availability_rule).permit(:rule_type, rule_data: [:custom_criteria])
    end
  
    # Create availability_rule record
    availability_rule = AvailabilityRule.create(availability_rule_params)
  
    if availability_rule.persisted?
      # Create tour record
      tour = Tour.create(tour_params)
  
      if tour.persisted?
        # Create availability record associated with the tour and availability_rule
        availability = tour.availabilities.create(availability_params.merge(availability_rule_id: availability_rule.id))
  
        if availability.persisted?
          render json: { tour: tour, availability: availability, availability_rule: availability_rule }, status: :created
        else
          render json: { error: "Failed to create availability" }, status: :unprocessable_entity
        end
      else
        render json: { error: "Failed to create tour" }, status: :unprocessable_entity
      end
    else
      render json: { error: "Failed to create availability_rule" }, status: :unprocessable_entity
    end
  end  
end
  