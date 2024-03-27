require 'rails_helper'

RSpec.describe Tour, type: :model do
  it { should have_many(:availabilities) }
end