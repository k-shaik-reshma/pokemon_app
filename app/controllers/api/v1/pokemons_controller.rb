class Api::V1::PokemonsController < ApplicationController
  def show
    render json: ::Commands::FetchPokemonCommand.new.execute
  end
end
