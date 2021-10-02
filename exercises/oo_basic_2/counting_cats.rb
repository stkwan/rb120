class Cat
  
  @@count_of_cats = 0
  
  def initialize
    @@count_of_cats += 1
  end
  
  def self.total
    puts @@count_of_cats
  end
  
end

kitty1 = Cat.new
kitty2 = Cat.new

Cat.total