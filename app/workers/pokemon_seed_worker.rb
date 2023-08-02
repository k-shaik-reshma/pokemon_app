# frozen_string_literal: true

class PokemonSeedWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform
    TypeApiService.fetch_types
    PokemonApiService.fetch_pokemon_data
  end
end
