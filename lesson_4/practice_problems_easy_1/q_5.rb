class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name, topping)
    @name = name
    @topping = topping
  ends
end

hawaiian = Pizza.new("Hawaii", "pineapple")

p hawaiian.instance_variables #=> [:name, :topping]
p hawaiian

banana = Fruit.new("banana")
p banana.instance_variables #=> []
p banana