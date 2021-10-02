class Person
  @@number_of_persons = 1
  
  def initialize(name)
    @name = name
  end
  
  def print_num_ppl
    @@number_of_persons
  end
  
end

steven = Person.new("Steven")

p steven.print_num_ppl
p steven
p Person.print_num_ppl