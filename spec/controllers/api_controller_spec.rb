# spec/controllers/api_controller_spec.rb
require 'rails_helper'

RSpec.describe ApiController, type: :controller do
  describe "GET #get_availability_tours" do
    it "returns a success response" do
      get :get_availability_tours
      expect(response).to be_successful
    end
  end

  describe "POST #create_tour_availability" do
    context "with valid parameters" do
      let(:tour_params) { FactoryBot.attributes_for(:tour) }
      let(:availability_params) { FactoryBot.attributes_for(:availability) }
      let(:availability_rule_params) { FactoryBot.attributes_for(:availability_rule) }

      it "creates a new tour, availability, and availability_rule" do
        expect {
          post :create_tour_availability, params: { tour: tour_params, availability: availability_params, availability_rule: availability_rule_params }
        }.to change(Tour, :count).by(1)
        .and change(Availability, :count).by(1)
        .and change(AvailabilityRule, :count).by(1)
      end

      it "renders a JSON response with the created tour, availability, and availability_rule" do
        post :create_tour_availability, params: { tour: tour_params, availability: availability_params, availability_rule: availability_rule_params }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors" do
        post :create_tour_availability, params: { tour: { name: nil }, availability: { start_time: nil }, availability_rule: { rule_type: nil } }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end
end
