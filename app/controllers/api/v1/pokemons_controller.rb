class Api::V1::PokemonsController < ApplicationController
  def show
    render json: Commands::FetchPokemonCommand.new(page: pokemon_params[:page]).execute
  end

  private

  def pokemon_params
    params.permit!
  end
end
