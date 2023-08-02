# frozen_string_literal: true

# spec/services/pokemon_api_service_spec.rb
require 'rails_helper'

RSpec.describe PokemonApiService do
  describe '.fetch_pokemon_data' do
    let(:pokemon_data) { double(results: pokemon_items) }
    let(:pokemon_items) do
      [
        double(name: 'Pikachu',
               get: double(name: 'Pikachu', height: 4, weight: 60, id: 25,
                           types: [double(type: double(name: 'electric'))])), double(name: 'Bulbasaur', get: double(name: 'Bulbasaur', height: 7, weight: 69, id: 1, types: [double(type: double(name: 'grass')), double(type: double(name: 'poison'))]))
      ]
    end

    before do
      allow(PokeApi).to receive(:get).with(pokemon: { limit: 10_000 }).and_return(pokemon_data)
    end

    it 'calls build_pokemon for each pokemon item' do
      PokemonApiService.fetch_pokemon_data
      expect(Pokemon.count).to eq(2)
    end
  end
end
