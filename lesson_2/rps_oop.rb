class Move
  VALUES = ['rock', 'paper', 'scissors']

  def initialize(value)
    @value = value
  end

  def to_s
    @value
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def scissors?
    @value == 'scissors'
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
  end
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    n = nil
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, or scissors:"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Good bye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end
  # def display_winner
  #  puts "#{human.name} chose #{human.move}."
  #  puts "#{computer.name} chose #{computer.move}."
  #
  #  case human.move
  #  when 'rock'
  #    puts "It's a tie!" if computer.move == 'rock'
  #    puts "You won!" if computer.move == 'scissors'
  #    puts "Computer won!" if computer.move == 'paper'
  #  when 'paper'
  #    puts "It's a tie!" if computer.move == 'paper'
  #    puts "You won!" if computer.move == 'rock'
  #    puts "Computer won!" if computer.move == 'scissors'
  #  when 'scissors'
  #    puts "It's a tie!" if computer.move == 'scissors'
  #    puts "You won!" if computer.move == 'paper'
  #    puts "Computer won!" if computer.move == 'rock'
  #  end
  # end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play agian? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, must be y or n."
    end
    answer
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      break if play_again? == 'n'
    end
    display_goodbye_message
  end
end

RPSGame.new.play

=begin
This design with `Human` and `Computer` sub-classes
appears to be clearer and more organized. It appears to
take a more "object-oriented" approach.
By sub-classing `Human` and `Computer`, we are
able to more easily view and change our code if either
`Human` or `Computer` requires re-factoring.
The primary improvment appears to be that we no longer
need conditionals for whether we are acting on human or
a computer. This is now implied by the sub-classes.
One potential drawback could be someone reading the
code must reference the superclass `Player` in order
to understand what happens when a `Human` or `Computer`
is initialized.
=end
