# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_230_802_213_212) do
  create_table 'pokemon_types', force: :cascade do |t|
    t.integer 'pokemon_id', null: false
    t.integer 'type_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['pokemon_id'], name: 'index_pokemon_types_on_pokemon_id'
    t.index ['type_id'], name: 'index_pokemon_types_on_type_id'
  end

  create_table 'pokemons', force: :cascade do |t|
    t.string 'name'
    t.integer 'weight'
    t.integer 'height'
    t.integer 'poke_api_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['name'], name: 'index_pokemons_on_name', unique: true
  end

  create_table 'types', force: :cascade do |t|
    t.string 'name'
    t.integer 'poke_api_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'poke_type_id'
    t.integer 'pokemon_id'
    t.index ['name'], name: 'index_types_on_name', unique: true
  end

  add_foreign_key 'pokemon_types', 'pokemons'
  add_foreign_key 'pokemon_types', 'types'
end
