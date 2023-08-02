# frozen_string_literal: true

FactoryBot.define do
  factory :pokemon do
    sequence(:name) { |n| "Pokemon #{n}" }
    height { Faker::Number.between(from: 1, to: 100) }
    weight { Faker::Number.between(from: 1, to: 1000) }

    after(:build) do |pokemon|
      pokemon.types << FactoryBot.create(:type)
    end
  end
end
