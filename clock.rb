# frozen_string_literal: true

require './config/boot'
require './config/environment'

module Clockwork
  every(1.day, 'midnight.job', at: '00:00') do
    PokemonSeedWorker.perform_async
  end
end
