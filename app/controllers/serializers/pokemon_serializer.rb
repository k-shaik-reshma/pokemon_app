module Serializers
  class PokemonSerializer < ActiveModel::Serializer
    attributes :id, :name
  end
end
