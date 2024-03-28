# Check if the :availability factory is already registered
unless FactoryBot.factories.registered?(:availability)
  FactoryBot.define do
    factory :availability do
    # transient do
    #     availability_rule { create(:availability_rule) }
    # end

    association :tour, factory: :tour
    association :availability_rule, factory: :availability_rule
    start_time { Time.now } # Adjust this attribute as per your requirements

    # Check if an availability record already exists before creating a new one
    initialize_with do
        existing_availability = Availability.find_by(tour: tour, availability_rule: availability_rule, start_time: start_time)
        existing_availability || new(tour: tour, availability_rule: availability_rule, start_time: start_time)
    end
    end
  end
end
  