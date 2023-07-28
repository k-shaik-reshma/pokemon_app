# frozen_string_literal: true

class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :weight
      t.integer :height
      t.integer :poke_api_id

      t.timestamps
    end
  end
end
