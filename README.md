## How to install the Project 💻

Step 1: Clone the project from
[here](git@github.com:k-shaik-reshma/pokemon_app.git) by using command
`git clone {link}`

Step 2: Once you clone the repo `cd {cloned_directory}`

Step 3: Install the below mentioned ruby version with either of the ruby version
managers like `rvm` or `rbenv`.

Step 4: Install the rails with help of `gem install rails`

Step 5: This project uses inbuilt sqlite given by Rails, So there is no need to
add any other additional databases like mysql or postgreSQL

Step 6: rails version used: 7.0.6 🚃

Step 7: ruby version used: 3.0.0 ♦️

Step 8: run the command `bundle install`

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

4. For maintaining the code linting uniformity this project follows extensive
   use for **rubocop**, the rules are mentioned in `rubocop.yml`
