class Vehicle
  def start_engine
    'Ready to go!'
  end
end

class Truck < Vehicle
  def start_engine(speed)
    super() + ' ' + "Drive #{speed}, please!"  #when our subclass instance method accepts an argument but superclass instance method does not, use empty parentheses "()" to signal that we are not passing anything to the superclass instance method
  end     # Invoking #super without parentheses passes all arguments to the superclass instance method
end

truck1 = Truck.new
puts truck1.start_engine('fast')