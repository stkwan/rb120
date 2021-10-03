=begin

When we called the go_fast method from an instance
of the Car class (as shown below) you might have noticed
that the string printed when we go fast includes the name
of the type of vehicle we are using. How is this done?

The method go_fast outputs a string. Within that string,
the #class method is called on self. `self` represents
the calling object, in this case `small_car`. Since
`small_car` is an instance of Car class, Car is returned
by the #class method. Notice that `Car` is placed in string 
interpoloation, which calls `to_s` on `Car` which returns
the string 'Car' which gets included in the output string.

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

small_car = Car.new
small_car.go_fast
#=> I am a Car and going super fast!