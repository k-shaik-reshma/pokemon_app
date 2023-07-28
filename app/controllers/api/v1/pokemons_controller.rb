# frozen_string_literal: true

module Api
  module V1
    class PokemonsController < ApplicationController
      def index
        pokemons = Commands::FetchPokemonCommand.new(page: pokemon_params[:page]).execute

        if pokemons.failure?
          render json: { message: pokemon.failure }, status: 400
        else
          render json: pokemons.value!, each_serializer: Serializers::PokemonSerializer
        end
      end

      def show
        pokemon = Commands::FetchPokemonCommand.new(page: pokemon_params[:page], id: pokemon_params[:id]).execute

        if pokemon.failure?
          render json: { message: pokemon.failure }, status: 400
        else
          render json: pokemon.value!, serializer: Serializers::PokemonSerializer
        end
      end

      private

      def pokemon_params
        params.permit!
      end
    end
  end
end
