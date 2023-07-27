class PokemonApiService
  # fetching pokemon data from poke-api-v2 gem
  def self.fetch_pokemon_data
    # Fetch Pokémon data from the API and process the response
    pokemon_api_data = PokeApi.get(pokemon: { limit: 10_000 }).results
    pokemon_api_data.each do |pokemon_item|
      build_pokemon(pokemon_item)
    end
  end

  def self.build_pokemon(pokemon_item)
    result = pokemon_item.get

    # Find or initialize the Pokemon based on the name
    pokemon = Pokemon.find_or_initialize_by(name: result.name)

    # Update the attributes
    pokemon.height      = result.height
    pokemon.weight      = result.weight
    pokemon.poke_api_id = result.id

    # Save the Pokemon record
    pokemon.save!

    # Seed Pokemon types
    seed_pokemon_types(result.types, pokemon)
  end

  def self.seed_pokemon_types(types, pokemon)
    types.each do |poke_api_type|
      type = pokemon.types.find_or_initialize_by(name: poke_api_type.type.name)
      type.poke_type_id = poke_api_type.type.url.split('/').last.to_i
      type.pokemon_id   = pokemon.id
      type.save!
    end
  end
end
