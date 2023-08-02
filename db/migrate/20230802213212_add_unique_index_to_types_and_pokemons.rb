# frozen_string_literal: true

class AddUniqueIndexToTypesAndPokemons < ActiveRecord::Migration[7.0]
  def change
    add_index :types, :name, unique: true
    add_index :pokemons, :name, unique: true
  end
end
