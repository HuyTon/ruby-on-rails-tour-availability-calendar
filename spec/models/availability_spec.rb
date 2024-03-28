require 'rails_helper'

RSpec.describe Availability, type: :model do
  describe "associations" do
    it "should belong to tour" do
      expect(described_class.reflect_on_association(:tour).macro).to eq(:belongs_to)
    end

    it "should belong to availability_rule" do
      expect(described_class.reflect_on_association(:availability_rule).macro).to eq(:belongs_to)
    end
  end
end
