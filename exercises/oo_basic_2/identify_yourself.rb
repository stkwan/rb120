class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end
  
  def identify
    self
  end
  
end

kitty = Cat.new('Sophie')

puts kitty # puts only prints the object, but not its attributes

p kitty #We use #p to print the object so that #inspect is called, which lets us view the instance variables and their values along with the object.

p kitty.identify # the #identify method returns `self` which is referring to the calling object