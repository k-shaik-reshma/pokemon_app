# frozen_string_literal: true

class PokeTypeIdToTypes < ActiveRecord::Migration[7.0]
  def change
    add_column :types, :poke_type_id, :integer
    add_column :types, :pokemon_id, :integer
  end
end
