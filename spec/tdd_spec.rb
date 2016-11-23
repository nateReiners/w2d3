require 'tdd'

describe Array do

  subject(:array) {[-1,1,1,2,2,3,3,4,5,5]}
  subject(:two_d_arr) { [[1, 2], [3, 4]] }
  subject(:stock) { [30, 40, 100, 90, 70, 10] }
  describe '#uniq' do
    it "removes duplicates from an Array" do
      expect(array.uniq).to eq([-1,1,2,3,4,5])
    end
  end

  describe '#two_sum' do
    it "returns indices of pairs that equal 0" do
      expect(array.two_sum).to eq([[0,1],[0,2]])
    end
  end

  describe "#my_transpose" do
    it "transposes a 2D grid" do
      expect(two_d_arr.my_transpose).to eq([[1, 3], [2, 4]])
    end
  end

  describe "#stock_picker" do
    it "returns best day to buy and sell stock" do
      expect(stock.stock_picker).to eq([0, 2])
    end
  end
end
