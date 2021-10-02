class Student
  def initialize(name, grade=nil)
    @name = name
    @grade = grade
  end
end

ade = Student.new('Adewale')
p ade # => #<Student:0x00000002a88ef8 @grade=nil, @name="Adewale">