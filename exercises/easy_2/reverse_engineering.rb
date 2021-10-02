class Transform
  
  attr_reader :string
  
  def self.lowercase(str) # class methods do not have access to instance variables.
    str.clone.downcase
  end
  
  
  def initialize(string)
    @string = string
  end
  
  def uppercase
    self.string.clone.upcase
  end
end


my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')

puts my_data.string