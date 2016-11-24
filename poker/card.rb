require 'byebug'
require 'colorize'

class Card
  attr_reader :suit, :value

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def to_string
    facecards = ["J", "Q", "K", "A"]
    # debugger
    suits_hash = {
        :Spade => "♠",
        :Heart => "♥".colorize(:red),
        :Diamond => "♦".colorize(:red),
        :Club => "♣"
      }
    if @value.between?(2,9)
      "#{suits_hash[@suit]}#{@value} "
    elsif @value == 10
      "#{suits_hash[@suit]}#{@value}"
    else
      "#{suits_hash[@suit]}#{facecards[@value-11]} "
    end
  end

end
