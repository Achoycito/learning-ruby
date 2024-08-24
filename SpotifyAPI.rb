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
  album_types = {'single' => 'del sencillo', 'album' => 'del álbum', 'compilation' => 'de la compilación'}

  album_types[response_album_type]
end

def ms_to_min ms
  min, ms = ms.divmod(1000 * 60)
  sec, ms = ms.divmod(1000)

  "#{min}:#{'0' if sec < 10}#{sec}" # Mostrar 10:03 en vez de 10:3
end

# spot_uri = "64xtjfsPHNHch0CZ7fPTjS" #Carrie & Lowell (Sufjan Stevens)
# spot_uri = "6AORtDjduMM3bupSWzbTSG" #evermore deluxe (Taylor Swift)
# spot_uri = "0He4NsgYFCODLfBKH0y3ln" #Life in Technicolor II (Coldplay)
# spot_uri = "7AS9VaIdnYSR13T3vkVtu9" #A Beginner's Mind (Sufjan Stevens & Angelo De Augustine)
# spot_uri = "35s58BRTGAEWztPo9WqCIs" #Into the Spiderverse Soundtrack (Varios artistas)
spot_uri = "4NtamseeVOGesCm8W9oHSz" #Sawdust (The Killers)

url = "https://api.spotify.com/v1/albums/#{spot_uri}"
auth = {"Authorization": "Bearer BQBg9FYeuNTSak39rnkqmJ-YxKKdQBOycBtgwauinH5u-KPnEJQRuvU3uA0joYNgVt5i6mPs5OuyxLbT70ogc2kjJ2HoFbagpGSrEOdoxiDQDwVV-8GdkE2_uvCDCUvoT4kzFE86DowEF5SJnNpEFZp5Zed1YisSMhxSsvvoceSBciY37AvGu6qiNxvvHs7ESbQRWlhvpWpJY1uN6VcSuOq6ZVY"}
# Token caduca en una hora
# Renovar en https://accounts.spotify.com/authorize?client_id=c22d5bca36be476d9fe0ef767e6619a3&redirect_uri=http://localhost:8888/callback&scope=user-read-private user-read-email&response_type=token&state=123

response = RestClient.get(url, headers=auth)
results = JSON.parse(response.to_str)

puts "\n\n"
puts "Estas son las #{results['tracks']['items'].length} canciones dentro #{album_type results['album_type']} \"#{results['name']}\" de #{stringify_artists results['artists']}"

results['tracks']['items'].each do |track|
  puts "#{track['track_number']}. #{track['name']}#{' (E)' if track['explicit']} (#{ms_to_min track['duration_ms']})"
end

puts "\nEscucha aquí: #{results['external_urls']['spotify']}"
puts "\n\n"