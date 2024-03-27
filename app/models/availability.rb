class Availability < ApplicationRecord
  belongs_to :tour
  belongs_to :availability_rule
end