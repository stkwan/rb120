class Pet
  attr_reader :type, :pet_name
  
  def initialize(type, pet_name)
    @type = type
    @pet_name = pet_name
  end
end



class Owner
  attr_reader :name
  attr_accessor :number_of_pets
  
  def initialize(name)
    @name = name
    @number_of_pets = 0
  end
end



class Shelter
  
  attr_reader :records
  
  def initialize
    @records = Hash.new { |record, owner| record[owner] = [] }
  end
  
  def adopt(owner, pet)
    self.records[owner] << pet
    owner.number_of_pets = records[owner].size
  end
  
  def print_adoptions
    records.each do |owner, pets|
      puts "#{owner.name} has adopted the following pets:"
      pets.each do |pet|
        puts "a #{pet.type} named #{pet.pet_name}"
      end
    end
  end
  
end



butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."