module Commands
  class FetchPokemonCommand < Command
    def initialize; end

    def execute
      fetch_all_pokemon
    end

    def fetch_all_pokemon
      Pokemon.all
    end
  end
end
