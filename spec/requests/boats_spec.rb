require 'rails_helper'
require 'factory_bot_rails'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

RSpec.describe Api::BoatsController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    let(:valid_params) { { boat: { name: 'New Boat', description: 'New Description' } } }

    it 'returns unprocessable entity for invalid data' do
      invalid_params = { boat: { name: nil } }
      post :create, params: invalid_params

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
