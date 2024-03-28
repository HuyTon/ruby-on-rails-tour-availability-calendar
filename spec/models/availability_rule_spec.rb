require 'rails_helper'

RSpec.describe AvailabilityRule, type: :model do
  describe "associations" do
    it "should have many availabilities" do
      association = described_class.reflect_on_association(:availabilities)
      expect(association.macro).to eq(:has_many)
    end
  end
end