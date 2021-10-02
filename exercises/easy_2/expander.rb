class Expander
  def initialize(string)
    @string = string
  end

  def to_s
    expand(3) #you can't call the method on self becuase private methods can never be called with an explicit caller, even when thet caller is self. Thus #expand must be called as expand(3). Ruby 2.7 allows self as caller.
  end

  private # to fix this we can either remove the prefix self and allow the method to be called without a caller or we can change private to protected

  def expand(n)
    @string * n
  end
end

expander = Expander.new('xyz')
puts expander

=begin
LS answer
The Expander#to_s method tries to call the
privatee #expand with the syntax self.expand(3)
The fails though since private methods 
can never be called with an explicit
caller, even when that caller is self.
Thus, #expand must be called as expand(3)

