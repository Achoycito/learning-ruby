require 'json'
require 'rest-client'

url = "https://pokeapi.co/api/v2/pokemon/ditto"

response = RestClient.get(url)
result = JSON.parse(response.to_str)

puts result