require 'uri'
require 'net/http'

url = URI("https://api.spotify.com/v1/albums/64xtjfsPHNHch0CZ7fPTjS")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)
request["accept"] = 'application/json'
request["token"] = 'c22d5bca36be476d9fe0ef767e6619a3'

response = http.request(request)
puts response.read_body