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
        for i in 0..@name.length
            puts @name[i]
        end
    end

end


alan = Person.new("Alan", "Gonzalez", 23)

# alan.name = "Alan"
# alan.lastname = "Gonzalez"
# alan.age = 23

puts alan.full_name
alan.print_birthdays
alan.guess_name
