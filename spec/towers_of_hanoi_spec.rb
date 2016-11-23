require 'towers_of_hanoi.rb'

describe TowersOfHanoi do
  subject(:game) { TowersOfHanoi.new }

  describe "#initialize" do
    it "initializes game with all discs on tower 0" do
      expect(game.towers).to eq([[3,2,1],[],[]])
    end
  end

  describe "#move" do
    it "moves from first tower to third tower" do
      game.move(0,2)
      expect(game.towers).to eq([[3,2],[],[1]])
    end

    it "throws error for invalid move" do
      expect do
        game.move(0, 2)
        game.move(0, 2)
      end.to raise_error(ArgumentError)
    end

    it "throws error for empty starting stack" do
      expect do
        game.move(2,0)
      end.to raise_error(ArgumentError)

    end

  end

  describe "#won?" do
    it "returns true when all disks are on stack 2" do
      game.towers = [[],[],[3,2,1]]
      expect(game.won?).to be true
    end
  end


end
