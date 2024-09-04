require 'json'
require 'rest-client'

def printResults response
  results = JSON.parse(response.to_str)

  if results['pagination']['total'] > 0
    puts "\n\n"
    puts "Mostrando #{results['pagination']['total']} propiedades en la cuenta de Staging en la API de EasyBroker (pág. #{results['pagination']['page']})"
  
    results['content'].each.with_index 1 do |property, index|
      puts "#{index}. #{property['title']}"
    end

    puts "\n\n"
  else
    puts "No se encontraron propiedades pertenecientes a la API key proporcionada."
  end
end

url = "https://api.easybroker.com/v1/properties"
auth = {"X-Authorization": "l7u502p8v46ba3ppgvj5y2aad50lb9"} # Token para cuenta de Staging

begin
  response = RestClient.get(url, headers=auth)
  printResults response
rescue RestClient::ExceptionWithResponse => e
  puts e.response
end