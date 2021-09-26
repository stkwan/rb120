class Student
  
  CURVE = 2
  
  attr_accessor :name
  attr_writer :grade
  
  def initialize(name, grade)
    @name = name
    @grade = grade
  end
  
  
  def better_grade_than?(other_student)
    self.grade > other_student.grade  # `other_student.grade` notice we are colling the protected method `grade` on an object given as an argument
  end
  
  
  protected # `protected` means that we can call these methods within the class for objects of the same class
  
  attr_reader :grade
  
end

joe = Student.new("Joe", 90)
bob = Student.new("Bob", 85)

p joe.better_grade_than?(bob)
p joe.grade