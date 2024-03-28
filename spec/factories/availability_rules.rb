unless FactoryBot.factories.registered?(:availability_rule)
  FactoryBot.define do
    factory :availability_rule do
        rule_type { "specific_dates" } # Set default value as needed
        rule_data { { dates: ["2024-01-05", "2024-02-06", "2024-03-15"] } } # Example rule data, adjust as needed
    end
  end
end