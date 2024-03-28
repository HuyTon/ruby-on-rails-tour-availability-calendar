require 'rails_helper'

RSpec.describe AvailabilitiesController, type: :controller do
  let(:availability) { FactoryBot.create(:availability) }
  let(:tour) { FactoryBot.create(:tour) }
  let(:availability_rule) { FactoryBot.create(:availability_rule) }

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do    
    it "returns a success response" do
      get :show, params: { id: availability.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid parameters" do      
      let(:valid_attributes) {
        { tour_id: tour.id, availability_rule_id: availability_rule.id, start_time: Time.now }
      }

      it "creates a new availability" do
        expect {
          post :create, params: { availability: valid_attributes }
        }.to change(Availability, :count).by(1)
      end

      it "renders a JSON response with the new availability" do
        post :create, params: { availability: valid_attributes }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the new availability" do
        post :create, params: { availability: FactoryBot.attributes_for(:availability, tour_id: nil) }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe "PUT #update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { start_time: Time.now }
      }

      it "updates the requested availability" do
        put :update, params: { id: availability.to_param, availability: new_attributes }
        availability.reload
        expect(availability.start_time.to_i).to be_within(1).of(Time.now.to_i)
      end

      it "renders a JSON response with the availability" do
        put :update, params: { id: availability.to_param, availability: new_attributes }
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the availability" do
        put :update, params: { id: availability.to_param, availability: FactoryBot.attributes_for(:availability, tour_id: nil) }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:availability) { FactoryBot.create(:availability) }

    it "destroys the requested availability" do
      expect {
        delete :destroy, params: { id: availability.to_param }
      }.to change(Availability, :count).by(-1)
    end

    it "returns a success response" do
      delete :destroy, params: { id: availability.to_param }
      expect(response).to have_http_status(:no_content)
    end
  end
end
