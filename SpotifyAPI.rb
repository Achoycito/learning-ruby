require 'json'
require 'rest-client'

spot_uri = "64xtjfsPHNHch0CZ7fPTjS" #Carrie & Lowell (Sufjan Stevens)

url = "https://api.spotify.com/v1/albums/#{spot_uri}"
auth = {"Authorization": "Bearer BQCxMc7DRgrv_Q9DJWck6GWofpMk372Fglo-_TQWdw7FNDelB-8tN0oaxv8yMqFKqe1P6K4KzATOlbDVHiW4dxCHEJK-KlpcHFzPAD7vmmFp3eVxGI09gccJ8C-Mhjl2B3Z_KwO2leBsOeGmQwMLGvmBcHEUBfKDRJPjPcFGRiKvu2ReyfHwYnAn2kiwntEWSnsZRqURJVlNtGQKYDblW1K-a3E"}

response = RestClient.get(url, headers=auth)
results = JSON.parse(response.to_str)
results_pretty = JSON.pretty_generate(results)

# puts results
puts results_pretty