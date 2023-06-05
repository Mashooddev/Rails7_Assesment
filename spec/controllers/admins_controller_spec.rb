require 'rails_helper'

RSpec.describe AdminsController, type: :controller do
  describe 'POST #login' do
    context 'with valid credentials' do
      let!(:admin) { FactoryBot.create(:admin, email: 'admin@example.com', password: 'password') }

      it 'returns a success status' do
        post :login, params: { email: 'admin@example.com', password: 'password' }, format: :json
        expect(response).to have_http_status(:success)
      end   

    end

    context 'with invalid credentials' do

      it 'returns an error message' do
        post :login, params: { email: 'admin@example.com', password: 'wrongpassword' }, format: :json
        expect(JSON.parse(response.body)['error']).to be_truthy
        expect(JSON.parse(response.body)['msg']).to eq('Email or password is wrong')
      end
    end
  end

  describe 'GET #index' do
    it 'returns a success status' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      let(:valid_params) { { admin: { email: 'newadmin@example.com', name: 'New Admin', password: 'password' } } }

      it 'creates a new admin' do
        expect {
          post :create, params: valid_params, format: :json
        }.to change(Admin, :count).by(1)
      end

      it 'returns a success status' do
        post :create, params: valid_params, format: :json
        expect(response).to have_http_status(:success)
      end

    end
  end
end
