=begin

Create a class called MyCar. When you initialize
a new instance or object of the class, allow the 
user to define some instance variables that tell
us the year, color, and model of the car. Create 
an instance variable that is set to 0 during instantiation 
of the object to track the current speed of the car 
as well. Create instance methods that allow the car 
to speed up, brake, and shut the car off.

# -------------------------------
Create a superclass called Vehicle for your MyCar class 
to inherit from and move the behavior that isn't specific 
to the MyCar class to the superclass. Create a constant 
in your MyCar class that stores information about the 
vehicle that makes it different from other types of Vehicles.

Then create a new class called MyTruck that inherits 
from your superclass that also has a constant defined that 
separates it from the MyCar class in some way.

# ---------------------------------
Add a class variable to your superclass that can keep track 
of the number of objects created that inherit from the superclass. 
Create a method to print out the value of this class variable as well.




=end

module Truckable
  
  def load_truck(number_of_packages)
    puts "The truck has been loaded with #{number_of_packages} packages."
  end
  
  def can_tow?(pounds)
    puts pounds < 2000 ? true : false
  end
  
end

class Vehicle
  attr_accessor :color, :model, :current_speed
  attr_reader :year
  
  @@number_of_vehicles = 0
  
  def self.total_number_of_vehicles
    @@number_of_vehicles
  end
  
  def self.get_gas_mileage(miles_traveled, gallons_used)
    puts "Your vehicle can travel #{miles_traveled / gallons_used} miles on a gallon of gas."
  end
  
  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
    @@number_of_vehicles += 1
  end
  
  def speed_up(mph=20)
    self.current_speed += mph
    puts "You push the gas and accelerate #{mph} mph."
  end
  
  def brake(mph)
    return 0 if mph > current_speed
    self.current_speed -= mph
    puts "You hit the brake and decelerate #{mph} mph."
  end
  
  def shut_off
    self.current_speed = 0
    puts "You turned off the vehicle."
  end
  
  def print_speed
    puts "Your current speed is #{current_speed} mph."
  end
  
  def spray_paint(new_color)
    self.color = new_color
    puts "The new vehicle color is #{new_color}."
  end
  
  def age
    "Your #{self.model} is #{calculate_age} years old."
  end
  
  private
  
  def calculate_age
    Time.now.year - self.year.to_i
  end
  
end


class MyCar < Vehicle
  
  DOORS = 4
  
  def to_s
    "This car is a #{year} #{color} #{model}."
  end
  
end


class MyTruck < Vehicle
  
  include Truckable
  
  DOORS = 2
  
  def to_s
    "This truck is a #{year} #{color} #{model}."
  end
end


lambo = MyCar.new(2015, "White", "Lamborghini Huracan")
tesla = MyTruck.new(2021, "Grey", "Tesla Semi")

p lambo

2.times { lambo.speed_up }
lambo.speed_up(40)
lambo.speed_up(20)
lambo.print_speed
lambo.brake(40)
lambo.print_speed
lambo.brake(50)
lambo.print_speed
lambo.shut_off
puts lambo.color
lambo.color = "Green"
puts lambo.color
lambo.spray_paint("Blue")

puts lambo

MyCar.get_gas_mileage(100, 4)
MyCar.superclass
p MyCar.ancestors

puts lambo # puts always calls to_s on the argument

puts tesla # puts calls always calls to_s on the argument

p Vehicle.total_number_of_vehicles
tesla.load_truck(100)
tesla.can_tow?(1999)

# -----------------------------------------------------------------------------
puts MyTruck.ancestors  # Calling ancestors gives us the method look up in order

# MyTruck       # first looks in 'MyTruck' class for method 
# Truckable     # next looks in the module that was included, 'Truckable' 
# Vehicle       # next looks in the superclass, 'Vehicles' 
# Object        # then looks at Ruby's classes
# Kernel
# BasicObject
# ------------------------------------------------------------------------------

p tesla.age
p lambo.age
