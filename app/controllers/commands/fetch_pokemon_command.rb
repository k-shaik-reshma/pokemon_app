require 'dry/monads'

class Commands::FetchPokemonCommand < Commands::Command
  attr_reader :page, :id

  include Dry::Monads[:result, :do]

  def initialize(page: 1, id: nil)
    super

    @page = page
    @id = id
  end

  def execute
    Success(fetch_pokemon)
  rescue StandardError => e
    Failure(e.message)
  end

  def fetch_pokemon
    return Pokemon.find_by!(name: id) if id.present? && id.to_i.zero?

    return Pokemon.find(id) if id.present? && id.try(:to_i).try(:positive?)

    Pokemon.paginate(page: page)
  end
end
