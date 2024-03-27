require 'rails_helper'

RSpec.describe Availability, type: :model do
  it { should belong_to(:tour) }
end