FactoryBot.define do
  factory :type do
    name { 'Some Type' }
    poke_api_id { 1 }
    poke_type_id { 1 }
    pokemon_id { 1 }
  end
end
