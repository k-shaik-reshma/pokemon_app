# spec/commands/fetch_pokemon_command_spec.rb
require 'rails_helper'

RSpec.describe Commands::FetchPokemonCommand do
  let(:page) { 1 }
  let(:id) { nil }
  let(:pokemon) { create(:pokemon) }
  subject(:command) { described_class.new(page: page, id: id) }

  describe '#execute' do
    context 'when fetching paginated pokemons' do
      it 'returns a Success monad' do
        result = command.execute
        expect(result).to be_a(Dry::Monads::Result::Success)
      end

      it 'fetches paginated pokemons' do
        expect(Pokemon).to receive(:paginate).with(page: page)
        command.execute
      end
    end

    context 'when fetching pokemon by id' do
      let(:id) { 1 }
      it 'returns a Success monad' do
        create(:pokemon)

        result = command.execute

        expect(result).to be_a(Dry::Monads::Result::Success)
      end

      it 'fetches the correct pokemon by id' do
        pokemon = create(:pokemon)
        result = command.execute

        expect(result.value!).to eq(pokemon)
      end
    end

    context 'when fetching pokemon by name' do
      let(:id) { 'Pikachu' }

      it 'returns a Success monad' do
        create(:pokemon)
        result = command.execute

        expect(result).to be_a(Dry::Monads::Result::Success)
      end

      it 'fetches the correct pokemon by name' do
        pokemon = create(:pokemon)
        result = command.execute

        expect(result.value!.name).to eq(pokemon.name)
      end
    end

    context 'when fetching pokemon with invalid id' do
      let(:id) { 'invalid_id' }

      it 'returns a Failure monad with an error message' do
        result = command.execute

        expect(result).to be_a(Dry::Monads::Result::Failure)
      end
    end
  end
end
