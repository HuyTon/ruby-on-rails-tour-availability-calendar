require 'rails_helper'

RSpec.describe "TourAvailabilities", type: :request do
  describe "POST /api/create_tour_availability" do
    context "with valid parameters" do
      let(:valid_params) do
        {
          tour: FactoryBot.attributes_for(:tour),
          availability: FactoryBot.attributes_for(:availability),
          availability_rule: FactoryBot.attributes_for(:availability_rule)
        }
      end

      it "creates a new tour, availability, and availability_rule" do
        post "/api/create_tour_availability", params: valid_params

        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context "with invalid parameters" do
      let(:invalid_params) do
        {
          tour: { name: nil },
          availability: { start_time: nil },
          availability_rule: { rule_type: nil }
        }
      end

      it "returns unprocessable entity status" do
        post "/api/create_tour_availability", params: invalid_params

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end
end