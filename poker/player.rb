require_relative "hand"

class Player
  def initialize(hand = Hand.new)
    @hand = hand
    @chip_count = 1_000
  end

  def discard
    p "Which cards would you like to discard (e.g 0,4,1):"
    indices = gets.chomp.split("").map(&:to_i)
    @hand = @hash.reject.with_index do |_,index|
      indices.include?(index)
    end
  end
  def fold_bet_check
    p "Would you like to check, bet, or fold?"
    input = gets.chomp
  end

end
