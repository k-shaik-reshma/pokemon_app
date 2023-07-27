class Commands::FetchPokemonCommand < Commands::Command
  attr_reader :page

  def initialize(page: 1)
    super

    @page = page
  end

  def execute
    fetch_all_pokemon
  end

  def fetch_all_pokemon
    Pokemon.paginate(page: page)
  end
end
