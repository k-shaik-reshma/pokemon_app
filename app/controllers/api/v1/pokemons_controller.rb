class Api::V1::PokemonsController < ApplicationController
  def show
    pokemons = Commands::FetchPokemonCommand.new(page: pokemon_params[:page]).execute
    render json: pokemons, each_serializer: Serializers::PokemonSerializer
  end

  private

  def pokemon_params
    params.permit!
  end
end
