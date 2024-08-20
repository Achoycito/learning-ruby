class Person
    attr_accessor :name, :lastname, :age

    def initialize(name, lastname, age)
        @name = name
        @lastname = lastname
        @age = age
    end

    def full_name
        "#{@name} #{@lastname}"
    end

    def print_birthdays
        for i in 1..@age
            puts "Cumpleaños ##{i}"
        end
    end

    def guess_name
        guessed_name = ""
        alphabet = "abcdefghijklmnopqrstuvwxyz"

        for i in 0...@name.length
            puts "Se va a intentar adivinar la letra #{@name[i]}"

            for j in 0...alphabet.length
                puts "Comparando letra #{alphabet[j]} con #{@name[i]}"
                if alphabet[j] == @name[i]
                    puts "COINCIDENCIA"
                    guessed_name.concat(alphabet[j].to_s)
                    puts "Adivinado actual: #{guessed_name}"
                    break
                end
            end

        end

        guessed_name
    end
end


alan = Person.new("alan", "gonzalez", 23)

puts "El nombre adivinado final es: #{alan.guess_name}"