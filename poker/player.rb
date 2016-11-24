require_relative "hand"

class Player
  attr_accessor :chip_count, :hand, :name

  def initialize(name, hand = Hand.new)
    @hand = hand
    @chip_count = 1_000
    @name = name
  end

  def discard
    @hand.render_hand
    puts "#{@name}, which cards would you like to discard (e.g 0,4,1):"
    indices = gets.chomp.split("").map(&:to_i)
    @hand.cards = @hand.cards.reject.with_index do |_,index|
      indices.include?(index)
    end
  end

  def fold_bet_check
    @hand.render_hand
    puts "#{@name}, your chip count: #{@chip_count}"
    puts "Would you like to check, bet, or fold?"
    gets.chomp
  end

  def bet
    puts "What would you like to bet?"
    bet_amount = gets.chomp.to_i
  end

  def fold_or_call
    @hand.render_hand
    puts "#{@name}, your chip count: #{@chip_count}"
    puts "#{@name}, would you like to fold or call?"
    gets.chomp
  end

end
