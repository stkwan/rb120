class Shape
  @@sides = nil
  
  def initialize
  end

  def self.sides
    @@sides
  end

  def sides
    @@sides
  end
end

class Quadrilateral < Shape
  def initialize
    @@sides = 4
  end
end

class Triangle < Shape
  def initialize
    @@sides = 3
  end
end



tri = Triangle.new
p tri
p tri.sides

p Triangle.sides
p Triangle.new.sides