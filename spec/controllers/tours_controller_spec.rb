require 'rails_helper'

RSpec.describe ToursController, type: :controller do
  let(:tour) { FactoryBot.create(:tour) }

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: tour.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new tour" do
        expect {
          post :create, params: { tour: FactoryBot.attributes_for(:tour) }
        }.to change(Tour, :count).by(1)
      end

      it "renders a JSON response with the new tour" do
        post :create, params: { tour: FactoryBot.attributes_for(:tour) }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the new tour" do
        post :create, params: { tour: FactoryBot.attributes_for(:tour, name: nil) }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe "PUT #update" do    
    context "with valid parameters" do
      let(:new_attributes) {
        { name: "New Tour Name" }
      }

      it "updates the requested tour" do
        put :update, params: { id: tour.to_param, tour: new_attributes }
        tour.reload
        expect(tour.name).to eq("New Tour Name")
      end

      it "renders a JSON response with the tour" do
        put :update, params: { id: tour.to_param, tour: new_attributes }
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the tour" do
        put :update, params: { id: tour.to_param, tour: FactoryBot.attributes_for(:tour, name: nil) }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:tour) { FactoryBot.create(:tour) }

    it "destroys the requested tour" do
      expect {
        delete :destroy, params: { id: tour.to_param }
      }.to change(Tour, :count).by(-1)
    end

    it "returns a success response" do
      delete :destroy, params: { id: tour.to_param }
      expect(response).to have_http_status(:no_content)
    end
  end
end
