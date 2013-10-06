require 'spec_helper'

describe Board do
  def tile_at x, y
    @board.tiles[x][y]
  end

  def check_accessible_in row, columns
    for i in 0..27
      if columns.include? i
        tile_at(row, i).accessible?.should be_true
      else
        tile_at(row, i).accessible?.should be_false
      end
    end
  end

  def check_accessible_not_in row, columns
    for i in 0..27
      if columns.include? i
        tile_at(row, i).accessible?.should be_false
      else
        tile_at(row, i).accessible?.should be_true
      end
    end
  end

  before :each do
    @board = Board.new
  end

  context "Setup" do

    it "Initializes the board with tiles" do
      @board.tiles.count.should == 36
      @board.tiles[0].count.should == 28

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

        for i in 1..26
          tile_at(3, i).accessible?.should be_true
        end

        tile_at(3, 27).accessible?.should be_false
      end

      it "Sets up Row 4" do
        check_accessible_in 4, [1, 12, 15, 27]
      end

      it "Sets up Row 5" do
        check_accessible_in 5, [1, 12, 15, 27]
      end

      it "Sets up Row 6" do
        check_accessible_not_in 6, [0, 7, 8, 13, 14, 19, 20, 27]
      end

      it "Sets up Row 7" do
        check_accessible_in 7, [3, 6, 9, 18, 21, 24]
      end

      it "Sets up Row 8" do
        check_accessible_in 8, [3, 6, 9, 18, 21, 24]
      end

      it "Sets up Row 9" do
        check_accessible_not_in 9, [1, 4, 5, 22, 23, 27]
      end

      it "Sets up Row 10" do
        check_accessible_in 10, [1, 6, 12, 15, 21, 26]
      end

      it "Sets up Row 11" do
        check_accessible_in 11, [1, 6, 12, 15, 21, 26]
      end

      it "Sets up Row 12" do
        check_accessible_not_in 12, [1, 13, 14, 27]
      end

      it "Sets up Row 13" do
        check_accessible_in 13, [6, 9, 18, 21]
      end

      it "Sets up Row 14" do
        check_accessible_in 14, [6, 9, 18, 21]
      end

    end
  end
end
