require 'rails_helper'

# spec/controllers/api/v1/pokemons_controller_spec.rb
RSpec.describe Api::V1::PokemonsController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end
  end
end
