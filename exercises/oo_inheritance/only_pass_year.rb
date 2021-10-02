class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  attr_reader :year
  attr_reader :bed_type
  
  def initialize(year, bed_type)
    super(year) # here we specify that we only want one argument, `year` to be passed as argument to method in superclass
    @bed_type = bed_type
  end
end

class Car < Vehicle
end

truck1 = Truck.new(1994, 'Short')
puts truck1.year
puts truck1.bed_type