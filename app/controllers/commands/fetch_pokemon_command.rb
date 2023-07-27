class Commands::FetchPokemonCommand < Commands::Command
  attr_reader :page, :id

  def initialize(page: 1, id: nil)
    super

    @page = page
    @id = id
  end

  def execute
    fetch_pokemon
  end

  def fetch_pokemon
    id_or_name = id.to_i
    return Pokemon.find_by(name: id) if id.present? && id_or_name.zero?

    return Pokemon.find(id) if id.present?

    Pokemon.paginate(page: page)
  end
end
