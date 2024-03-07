require 'rails_helper'
require 'factory_bot_rails'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

RSpec.describe Api::ReservationsController, type: :controller do
  describe 'GET #index' do
    it 'returns a list of reservations' do
      reservation = create(:reservation)
      get :index
      expect(response).to have_http_status(:ok)
      expect(assigns(:reservations)).to eq([reservation])
    end
  end

  describe 'GET #show' do
    it 'returns reservations for a specific user' do
      user = create(:user)
      reservation = create(:reservation, user:)
      get :show, params: { id: user.name }
      expect(response).to have_http_status(:ok)
      expect(assigns(:reservations)).to eq([reservation])
    end

    it 'returns a not found message if user is not found' do
      get :show, params: { id: 'nonexistentuser' }
      expect(response).to have_http_status(:not_found)
      expect(JSON.parse(response.body)['error']).to eq('User not found')
    end
  end

  describe 'POST #create' do
    let(:valid_params) { { reservation: attributes_for(:reservation) } }
    it 'returns unprocessable entity for invalid data' do
      invalid_params = { reservation: { date: nil, city: 'New York', boat_id: 1, user_id: 1 } }
      post :create, params: invalid_params
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
