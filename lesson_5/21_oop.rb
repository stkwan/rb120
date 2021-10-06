class Player
  attr_accessor :hand
  attr_writer :current_total

  def initialize(name)
    @name = name
    @hand = []
    @current_total = current_total
  end

  def busted?
    current_total > 21
  end

  def current_total
    sum = 0
    hand.each do |card|
      case card[0]
      when "J", "Q", "K" then sum += 10
      when "A" then sum += 11
      else sum += card[0]
      end
    end
    sum -= (10 * count_of_aces) if sum > 21
    sum
  end

  def [](index)
    "#{hand[index][0]} of #{hand[index][1]}"
  end

  private

  def count_of_aces
    hand.count { |card| card.first == "A" }
  end
end

class Deck
  def initialize
    @cards = cards
  end

  def hit
    cards.pop
  end

  private

  def cards
    cards = []
    faces = [2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K", "A"]
    suits = ["hearts", "diamonds", "clubs", "spades"]
    faces.each do |face|
      suits.each do |suit|
        cards << [face, suit]
      end
    end
    cards.shuffle!
  end
end

class Game
  attr_reader :deck, :human, :dealer

  def initialize
    @deck = Deck.new
    @human = Player.new(:human)
    @dealer = Player.new(:dealer)
  end

  def start
    welcome_message
    loop do
      deal_cards
      show_initial_cards
      human_turn
      dealer_turn unless human.busted?
      show_result unless human.busted? || dealer.busted?
      break unless play_again?
    end
    goodbye_message
  end

  private

  def welcome_message
    system "clear"
    puts "Welcome to Twenty One!"
    puts "Press enter to start!"
    gets
    system "clear"
  end

  def deal_cards
    2.times { human.hand << deck.hit }
    2.times { dealer.hand << deck.hit }
  end

  def show_initial_cards
    puts "Dealer has [#{dealer[0]}] and an unknown card."
    puts ""
    puts "You have [#{human[0]}] and [#{human[1]}]."
    puts ""
  end

  # rubocop: disable Metrics/MethodLength
  def human_answer
    answer = nil
    loop do
      puts "You current total is #{human.current_total}"
      puts ""
      break if human.busted?
      puts "Would you like to hit or stay? ('h' / 's')"
      answer = gets.chomp
      break if ["h", "s"].include?(answer.downcase)
      puts "Invalid entry, try again."
    end
    answer
  end

  def human_turn
    loop do
      answer = human_answer
      break if human.busted?
      if answer.downcase == "h"
        human.hand << deck.hit
        puts "You got a [#{human[-1]}]."
        next if !human.busted?
      elsif answer.downcase == "s"
        break
      end
    end
    short_circut_winner if human.busted?
  end

  def dealer_turn
    puts "Dealer's turn!"
    loop do
      break if dealer.current_total >= 17 && dealer.current_total <= 21
      if dealer.current_total < 17
        dealer.hand << deck.hit
        next
      elsif dealer.busted?
        short_circut_winner
        break
      end
    end
  end

  def show_result
    puts "Dealer shows his hand:"
    puts ""
    dealer_hand
    puts ""
    puts "You have #{human.current_total}"
    puts "Dealer has #{dealer.current_total}"
    if human.current_total > dealer.current_total
      puts "You win!"
    elsif human.current_total < dealer.current_total
      puts "Dealer wins!"
    else
      puts "It's a tie!"
    end
  end
  # rubocop: enable Metrics/MethodLength

  def dealer_hand
    0.upto(dealer.hand.size - 1) { |i| puts dealer[i].to_s }
  end

  def short_circut_winner
    if human.busted?
      puts "You Busted! Dealer wins!"
    elsif dealer.busted?
      puts "Dealer shows his hand:"
      puts ""
      dealer_hand
      puts ""
      puts "Dealer has #{dealer.current_total}"
      puts "Dealer Busted! You win!"
    end
  end

  def reset_hands
    human.hand = []
    dealer.hand = []
  end

  def play_again?
    answer = nil
    loop do
      puts "Play again? y/n"
      answer = gets.chomp.downcase
      break if ["y", "n"].include?(answer)
      puts "Invalid response."
    end
    reset_hands if answer == "y"
    system "clear" if answer == "y"
    answer == "y"
  end

  def goodbye_message
    puts "Thanks for playing Twenty One! Good bye!"
  end
end

Game.new.start
