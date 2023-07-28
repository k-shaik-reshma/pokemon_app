require './config/boot'
require './config/environment'

module Clockwork
  every(5.seconds, 'pokemon seeding job') do
    PokemonSeedWorker.perform_async
  end
end
