## How to install the Project 💻

Step 1: Clone the project

Step 2: rails version used: 7.0.6 🚃

Step 3: ruby version used: 3.0.0 ♦️

Step 4: run the command `bundle install`

#

## How to start the project ?

Run the command `rails server`

#

## How to update the pokemon list

This project uses `sidekiq` for running background jobs asynchronously

Every day at minight 00:00 a job is scheduled to update the pokemon list using a
gem called `clock-work` for more info
[Here](https://github.com/adamwiggins/clockwork)

Job Name: ` PokemonSeedWorker.perform_async`

#

## How to consume the API provided

DB with models Pokemon has_many types are created. There are 2 API's which are
detailedly listed on Swagger documentation here
[https://app.swaggerhub.com/apis-docs/KSHAIKRESHMA98/Pokemon/1.0.0#/Pokemons/getPokemonById](https://app.swaggerhub.com/apis-docs/KSHAIKRESHMA98/Pokemon/1.0.0#/Pokemons/getPokemonById)

## Things To Know 🤔

1. **Command Design Patterns** used for fetching pokemon.

2. **DRY-Monad** is used for API error handling.

3. **Rspec** is used for writing test cases `bundle exec rspec`

4. Entire Code is linted with **Rubocop**
