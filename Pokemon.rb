require 'json'
require 'rest-client'

url = "https://pokeapi.co/api/v2/pokemon-species/aegislash"

response = RestClient.get(url)
result = JSON.parse(response.to_str)
# puts JSON.pretty_generate(result)

# puts result
puts "##{result['pokedex_numbers'][0]['entry_number']}. #{result['name']}"