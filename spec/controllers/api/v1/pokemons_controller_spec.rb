require 'rails_helper'

# spec/controllers/api/v1/pokemons_controller_spec.rb
RSpec.describe Api::V1::PokemonsController, type: :controller do
  describe 'GET #index' do
    let(:pokemons) { create_list(:pokemon, 10) }
    it 'returns a successful response' do
      get :index

      expect(response).to be_successful
    end

    it 'returns paginated pokemons based on the page parameter' do
      create_list(:pokemon, 100)
      get :index, params: { page: 2 }

      result = JSON.parse(response.body, serialize: true)

      expect(result.count).to eq(30)
    end

    it 'returns an empty array if the page has no pokemons' do
      get :index, params: { page: 9999 }

      result = JSON.parse(response.body, serialize: true)

      expect(result.count).to eq(0)
    end
  end

  describe 'GET #show' do
    let(:pokemon) { create(:pokemon) }

    it 'returns a successful response' do
      get :show, params: { id: pokemon.id }

      expect(response).to be_successful
    end

    it 'returns a not found response for invalid id' do
      get :show, params: { id: 99_999 }

      expect(response).to have_http_status(:bad_request)
    end
  end
end
