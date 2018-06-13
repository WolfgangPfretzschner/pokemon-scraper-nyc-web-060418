require_relative "environment"

Scraper.new(@db).scrape

all_pokemon = @db.execute("SELECT * FROM pokemon;")

# pokemon_1 = Pokemon.new("pokemonname","testtype", )
#
# Pry.start
