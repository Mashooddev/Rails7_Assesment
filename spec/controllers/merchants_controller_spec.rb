require 'rails_helper'

RSpec.describe MerchantsController, type: :controller do

  describe 'POST #create' do
    let(:merchant_params) { FactoryBot.attributes_for(:merchant) }

    it 'creates a new merchant with valid parameters' do
      post :create, params: { merchant: merchant_params }, format: :json

      expect(response).to have_http_status(:success)
      expect(Merchant.last.email).to eq(merchant_params[:email])
    end
  end
end
