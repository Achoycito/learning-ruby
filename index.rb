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

    def is_adult
        @age >= 18
    end

    def guess_name
        guessed_name = ""
        alphabet = "abcdefghijklmnopqrstuvwxyz"

        for i in 0 ... @name.length
            # puts @name[i].ord
            puts "Se va a intentar adivinar la letra #{@name[i]}"

            for j in 0 ... alphabet.length
                puts "Comparando letra #{alphabet[j]} con #{@name[i]}"
                if alphabet[j] == @name[i]
                    puts "COINCIDENCIA"
                    guessed_name << alphabet[j].to_s
                    puts "Adivinado actual: #{guessed_name}"
                    break
                end
            end

        end

        guessed_name
    end
end


alan = Person.new("ALAN", "gonzalez", 23)

puts "El nombre adivinado final es: #{alan.guess_name}"

if alan.is_adult
    puts "#{alan.name} es un adulto mayor de edad"
else
    puts "#{alan.name} es menor de edad"
end
