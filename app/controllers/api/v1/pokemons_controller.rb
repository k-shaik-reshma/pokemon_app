class Api::V1::PokemonsController < ApplicationController
  def show
    render json: Pokemon.all
  end
end
