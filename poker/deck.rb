require_relative 'hand'

class Deck
  attr_reader :deck
  def initialize
    @deck = []

    deck_gen
  end

  def deck_gen
    suits = [:Heart, :Diamond, :Club, :Spade]
    (2..14).each do |val|
      suits.each do |suit|
        @deck << Card.new(val, suit)
      end
    end
    @deck.shuffle!
  end

  def deal_cards
    @deck.take(5)
  end
end
#
10.times do
  x = Deck.new
  hand = Hand.new(x.deal_cards)
  hand.render_hand
end
# #
# p hand.straight_flush?
# p hand.flush?
# p hand.straight?
# p hand.four_of_a_kind?
# p hand.full_house?
# p hand.three_of_a_kind?
# p hand.two_pair?
# p hand.pair?

#
# p x.deck.sort_by { |card| card.value }
