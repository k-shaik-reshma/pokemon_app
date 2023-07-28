class PokemonSeedWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform
    PokemonApiService.fetch_pokemon_data
  end
end
