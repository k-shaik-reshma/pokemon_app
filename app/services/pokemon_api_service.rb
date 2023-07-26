class PokemonApiService
  # fetching pokemon data from poke-api-v2 gem
  def self.fetch_pokemon_data
    # Fetch Pokémon data from the API and process the response
    pokemon_data = PokeApi.get(pokemon: { limit: 10_000 }).results
    pokemon_data.each do |_|
      result = _.get
      pokemon = Pokemon.find_or_initialize_by(name: result.name)
      pokemon.height = result.height
      pokemon.weight = result.weight
      pokemon.poke_api_id = result.id
      pokemon.save!
    end
  end
end
