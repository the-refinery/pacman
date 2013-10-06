require 'spec_helper'

describe Board do
  def tile_at x, y
    @board.tiles[x][y]
  end

  before :each do
    @board = Board.new
  end

  context "Setup" do

    it "Initializes the board with tiles" do
      @board.tiles.count.should == 28
      @board.tiles[0].count.should == 36

      tile = tile_at 4, 26
      tile.x.should == 4
      tile.y.should == 26
    end

    context "Identifies available tiles" do
      it "Sets up Row 0" do
        @board.tiles[0].each_value do |tile|
          tile.accessible?.should be_false
        end
      end

      it "Sets up Row 1" do
        @board.tiles[1].each_value do |tile|
          tile.accessible?.should be_false
        end
      end

      it "Sets up Row 2" do
        @board.tiles[2].each_value do |tile|
          tile.accessible?.should be_false
        end
      end

      it "Sets up Row 3" do
        tile_at(3, 0).accessible?.should be_false

        for i in 1..34
          tile_at(3, i).accessible?.should be_true
        end

        tile_at(3, 35).accessible?.should be_false
      end
    end
  end

end
