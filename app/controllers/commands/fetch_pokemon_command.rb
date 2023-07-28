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
    id_or_name = id.to_i
    return Pokemon.find_by(name: id) if id.present? && id_or_name.zero?

    return Pokemon.find(id) if id.present?

    Pokemon.paginate(page: page)
  end
end
