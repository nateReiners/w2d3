require_relative 'deck'
require_relative 'player'

class Game
  attr_accessor :pot, :current_bet_amount

  def initialize(*players)
    @deck = Deck.new
    @players = players
    @active_players = players
    @pot = 0.to_f
    @current_bet_amount = nil
  end


  def play_round
    @active_players = @players
    @pot = 0
    ante(50)
    deal_cards
    betting_round

    puts "Current pot value: #{@pot}."
    discard
    replenish_hands
    betting_round
    puts "Current pot value: #{@pot}."
    compare_hands
    empty_hands
    @deck = Deck.new
  end

  def empty_hands
    @players.each do |player|
      player.hand.cards = []
    end
  end

  # add more precise comparison method
  def compare_hands
    players_hash = Hash.new(0)
    @active_players.each do |player|
      players_hash[player] = player.hand.analyze_hand_value
    end

    highest_val = players_hash.values.max
    winners = players_hash.reject { |_, val| val != highest_val }

    winners.keys.each do |winner|
      winner.chip_count += @pot.to_f / winners.length.to_f
    end
    winners_str = "This rounds winner(s) is/are"
    winners.keys.each do |winner|
      winners_str << " #{winner.name}"
    end
    winners_str << "!!!!\n"
    puts winners_str
  end

  def deal_cards
    @players.each do |player|
      5.times do
        player.hand.cards << @deck.cards.shift
      end
    end
  end

  def ante(amount)
    @players.each do |player|
      player.chip_count -= amount
      @pot += amount
    end
  end

  def betting_round
    @active_players.each do |player|
      puts "Current pot value: #{@pot}."
      if @current_bet_amount
        handle_fold_or_call(player)
      else
        handle_fold_bet_check(player)
      end
    end
    @current_bet_amount = nil
  end

  def handle_fold_or_call(player)
    case player.fold_or_call
    when "call"
      player.chip_count -= @current_bet_amount
      @pot += @current_bet_amount
    when "fold"
      @active_players = @active_players.reject { |pl| pl == player }
    end
  end

  def handle_fold_bet_check(player)
    case player.fold_bet_check #fold/bet/check
    when "fold"
      @active_players = @active_players.reject { |pl| pl == player }
    when "bet"
      bet_amount = player.bet
      player.chip_count -= bet_amount
      @pot += bet_amount
      @current_bet_amount = bet_amount
    end
  end

  def discard
    @active_players.each do |player|
      player.discard
    end
  end

  def replenish_hands
    @active_players.each do |player|
      until player.hand.cards.length == 5
        player.hand.cards << @deck.cards.shift
      end
    end
  end

  def run
    loop do
      play_round
    end
  end
end

matt = Player.new("Matt")
nate = Player.new("Nate")
game = Game.new(matt, nate)
game.run
