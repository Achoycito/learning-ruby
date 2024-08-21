require 'uri'
require 'net/http'

url = URI("https://api.easybroker.com/v1/properties")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)
request["accept"] = 'application/json'
request["X-Authorization"] = 'l7u502p8v46ba3ppgvj5y2aad50lb9'

response = http.request(request)
puts response.read_body