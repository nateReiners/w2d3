class TowersOfHanoi
  attr_accessor :towers
  def initialize
    @towers = [[3,2,1],[],[]]
    @original_length = @towers.first.length
    @num_moves = 0
  end

  def move(starting_index, ending_index)
    raise ArgumentError if @towers[starting_index].empty?

    unless @towers[ending_index].last.nil? ||
       @towers[ending_index].last > @towers[starting_index].last
        raise ArgumentError, "invalid input!"
    end
    disk = @towers[starting_index].pop
    @towers[ending_index] << disk
    @num_moves += 1
  end

  def won?
    @towers.last.length == @original_length
  end

  def play
    until won?
      begin
        print @towers
        print "what is your starting and ending positions (e.g. 0,1)?"
        positions  = gets.chomp.split(",").map(&:to_i)
        p positions
        move(positions[0], positions[1])
      rescue
        p "You entered a wrong position. Enter again:"
        retry
      end
    end
    p "You have won the game in #{@num_moves} moves!"
  end
end

if __FILE__ == $PROGRAM_NAME
  game = TowersOfHanoi.new
  game.play
end
