require 'json'
require 'rest-client'

def stringify_artists(response_artists)
  artists_array = []

  response_artists.each do |artist|
    artists_array.append artist['name']
  end
  
  artists_array.join(" • ") # Hugo • Paco • Luis
end

def album_type response_album_type
  album_types = {'single' => 'sencillo', 'album' => 'álbum', 'compilation' => 'compilación'}

  album_types[response_album_type]
end

def ms_to_min ms
  min, ms = ms.divmod(1000 * 60)
  sec, ms = ms.divmod(1000)

  "#{min}:#{'0' if sec < 10}#{sec}" # Mostrar 10:03 en vez de 10:3
end


# spot_uri = "64xtjfsPHNHch0CZ7fPTjS" #Carrie & Lowell (Sufjan Stevens)
# spot_uri = "6AORtDjduMM3bupSWzbTSG" #evermore deluxe (Taylor Swift)
spot_uri = "0He4NsgYFCODLfBKH0y3ln" #Life in Technicolor II (Coldplay)
# spot_uri = "7AS9VaIdnYSR13T3vkVtu9" #A Beginner's Mind (Sufjan Stevens & Angelo De Augustine)
# spot_uri = "35s58BRTGAEWztPo9WqCIs" #Into the Spiderverse Soundtrack (Varios artistas)

url = "https://api.spotify.com/v1/albums/#{spot_uri}"
auth = {"Authorization": "Bearer BQDbAkw70r4cRL1o9Y2SZt9_t83Pa8aCqNfv8RX7PQCc535l4buAHDfunE3x0hla2r0KpDm5GQcNcYDWMnxhdG_OO4D3oOf3czV8iRlif39Ce5NwUYxymfInmFVFuRV7cidsMFNM0YLQ7usItozlQr3L2gs_b4LyhHVLc9PrUA7gaxHq-je_XTk2GiZMpCjCBla6nJuPFMqCn2f6SbsMp6qiuLM"}
# Token caduca en una hora
# Renovar en https://accounts.spotify.com/authorize?client_id=c22d5bca36be476d9fe0ef767e6619a3&redirect_uri=http://localhost:8888/callback&scope=user-read-private user-read-email&response_type=token&state=123

response = RestClient.get(url, headers=auth)
results = JSON.parse(response.to_str)
# results_pretty = JSON.pretty_generate(results)


puts "\n\n"
# puts results
# puts results_pretty

puts "Estas son las #{results['tracks']['items'].length} canciones dentro del #{album_type results['album_type']} \"#{results['name']}\" de #{stringify_artists results['artists']}"

results['tracks']['items'].each do |track|
  puts "#{track['track_number']}. #{track['name']}#{' (E)' if track['explicit']} (#{ms_to_min track['duration_ms']})"
end

puts "\nEscucha aquí: #{results['external_urls']['spotify']}"
puts "\n\n"