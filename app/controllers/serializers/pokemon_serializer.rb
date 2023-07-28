# frozen_string_literal: true

module Serializers
  class PokemonSerializer < ActiveModel::Serializer
    attributes :id, :name, :weight, :height

    has_many :types, serializer: Serializers::TypeSerializer
  end
end
