class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new('Black')
puts cat1.color
puts Cat.ancestors

# The loop up path used was [ Cat, Animal ]. First Ruby checked the Cat class
# then checked the Animal class. Since #initialize was found in the Animal
# class, Ruby stops looking.