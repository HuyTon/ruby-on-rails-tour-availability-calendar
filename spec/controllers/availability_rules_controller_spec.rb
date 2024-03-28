require 'rails_helper'

RSpec.describe AvailabilityRulesController, type: :controller do
  let(:availability_rule) { FactoryBot.create(:availability_rule) }

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do    
    it "returns a success response" do
      get :show, params: { id: availability_rule.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with invalid parameters" do
      it "renders a JSON response with errors for the new availability rule" do
        post :create, params: { availability_rule: FactoryBot.attributes_for(:availability_rule, rule_type: nil) }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe "PUT #update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { rule_type: "weekly", rule_data: { days: ["Monday", "Wednesday", "Friday"] } }
      }

      it "updates the requested availability rule" do
        put :update, params: { id: availability_rule.to_param, availability_rule: new_attributes }
        availability_rule.reload
        expect(availability_rule.rule_type).to eq("weekly")
      end

      it "renders a JSON response with the availability rule" do
        put :update, params: { id: availability_rule.to_param, availability_rule: new_attributes }
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the availability rule" do
        put :update, params: { id: availability_rule.to_param, availability_rule: FactoryBot.attributes_for(:availability_rule, rule_type: nil) }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:availability_rule) { FactoryBot.create(:availability_rule) }

    it "destroys the requested availability rule" do
      expect {
        delete :destroy, params: { id: availability_rule.to_param }
      }.to change(AvailabilityRule, :count).by(-1)
    end

    it "returns a success response" do
      delete :destroy, params: { id: availability_rule.to_param }
      expect(response).to have_http_status(:no_content)
    end
  end
end
