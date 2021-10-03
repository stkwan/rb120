=begin

If we have a Car class and a Truck class and we want to be 
able to go_fast, how can we add the ability for them to 
go_fast using the module Speed? How can you check if your 
Car or Truck can now go fast?

We must include the module Speed in both Car and Truck
classes to give them the behavior of go_fast. We can 
check if objects from the Car and Truck classes are able 
to go_fast by creating an instance of each and calling
go_fast on the Car object and the Truck object
=end


module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed
  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

lambo = Car.new
tesla = Truck.new

lambo.go_fast
tesla.go_fast