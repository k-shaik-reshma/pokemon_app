# frozen_string_literal: true

class PokemonApiService
  # fetching pokemon data from poke-api-v2 gem
  def self.fetch_pokemon_data
    # Fetch Pokémon data from the API and process the response
    pokemon_api_data = PokeApi.get(pokemon: { limit: 10_000 }).results
    pokemon_api_data.map { |pokemon_item| build_pokemon(pokemon_item) }
  end

  def self.build_pokemon(pokemon_item)
    result = pokemon_item.get

    # Find or initialize the Pokemon based on the name
    pokemon = Pokemon.find_or_initialize_by(name: result.name)

    # Update the attributes
    pokemon.assign_attributes(pokemon_attributes(result))
    type_names = result.types.map { |pokemon_type| pokemon_type.type.name }
    pokemon.types << Type.where(name: type_names)
    # Save the Pokemon record
    pokemon.save!
  end

  def self.pokemon_attributes(result)
    {
      name: result.name,
      height: result.height,
      weight: result.weight,
      poke_api_id: result.id
    }
  end
end
