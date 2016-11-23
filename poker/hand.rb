require_relative "card"

class Hand
  attr_accessor :cards

  def initialize(cards = [])
    @cards = cards
  end

  def analyze_hand_value
    if straight_flush?
      8
    elsif four_of_a_kind?
      7
    elsif full_house?
      6
    elsif flush?
      5
    elsif straight?
      4
    elsif three_of_a_kind?
      3
    elsif two_pair?
      2
    elsif pair?
      1
    else
      0
    end
  end

  def straight_flush?
    straight? && flush?
  end

  def flush?
    @cards.all? { |card| card.suit == @cards[0].suit }
  end

  def straight?
    sort_cards
    i = 1
    until i == @cards.length
      previous_card_val = @cards[i - 1].value
      current_card_val = @cards[i].value
      return false unless current_card_val == previous_card_val + 1
      i += 1
    end
    true
  end

  def four_of_a_kind?
    card_counts == [1, 4]
  end

  def full_house?
    card_counts == [2,3]
  end

  def three_of_a_kind?
    card_counts == [1,1,3]
  end

  def two_pair?
    card_counts == [1,2,2]
  end

  def pair?
    card_counts == [1,1,1,2]
  end

  # improve this method for subvalues/edge-cases

  # def compare_hands(other_hand)
  #   player1_hand_value = @cards.analyze_hand_value
  #   player2_hand_value = other_hand.cards.analyze_hand_value
  #   case player1_hand_value <=> player2_hand_value
  #   when -1
  #     return -1
  # end

  private

  def sort_cards
    @cards = @cards.sort_by { |card| card.value }
  end

  def card_counts_hash
    card_counts_hash = Hash.new(0)
    @cards.each do |card|
      card_counts_hash[card.value] += 1
    end
    card_counts_hash
  end

  def card_counts
    card_counts_hash.values.sort
  end
end
