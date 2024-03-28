unless FactoryBot.factories.registered?(:tour)
  FactoryBot.define do
    factory :tour do
        name { "Sample Tour" }
        description { "A sample tour description" }
        duration_hours { 3 }
        duration_days { 1 }
    end
  end
end