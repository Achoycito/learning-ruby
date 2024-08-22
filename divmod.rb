ms = 199146

min, ms = ms.divmod(1000 * 60)
sec, ms = ms.divmod(1000)

puts "Una canción de #{ms} milisegundos dura #{min} minutos y #{sec} segundos"