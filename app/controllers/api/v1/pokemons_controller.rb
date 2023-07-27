class Api::V1::PokemonsController < ApplicationController
  def index
    pokemons = Commands::FetchPokemonCommand.new(page: pokemon_params[:page]).execute
    render json: pokemons, each_serializer: Serializers::PokemonSerializer
  end

  def show
    pokemon = Commands::FetchPokemonCommand.new(page: pokemon_params[:page], id: pokemon_params[:id]).execute
    render json: pokemon, serializer: Serializers::PokemonSerializer
  end

  private

  def pokemon_params
    params.permit!
  end
end
