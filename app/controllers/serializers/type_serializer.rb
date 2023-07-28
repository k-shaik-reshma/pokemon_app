# frozen_string_literal: true

module Serializers
  class TypeSerializer < ActiveModel::Serializer
    attributes :id, :name, :poke_type_id
  end
end
