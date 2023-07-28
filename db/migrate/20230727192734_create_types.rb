# frozen_string_literal: true

class CreateTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :types do |t|
      t.string :name
      t.integer :poke_api_id
      t.string :timestamps

      t.timestamps
    end
  end
end
