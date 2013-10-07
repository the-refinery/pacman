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
        check_accessible_not_in 3, [0, 27]
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
        check_accessible_not_in 9, [0, 4, 5, 22, 23, 27]
      end

      it "Sets up Row 10" do
        check_accessible_in 10, [1, 6, 12, 15, 21, 26]
      end

      it "Sets up Row 11" do
        check_accessible_in 11, [1, 6, 12, 15, 21, 26]
      end

      it "Sets up Row 12" do
        check_accessible_not_in 12, [0, 13, 14, 27]
      end

      it "Sets up Row 13" do
        check_accessible_in 13, [6, 9, 18, 21]
      end

      it "Sets up Row 14" do
        check_accessible_in 14, [6, 9, 18, 21]
      end

      it "Sets up Row 15" do
        check_accessible_in 15, [6, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 21]
      end

      it "Sets up Row 16" do
        check_accessible_in 16, [6, 9, 18, 21]
      end

      it "Sets up Row 17" do
        check_accessible_in 17, [6, 9, 18, 21]
      end

      it "Sets up Row 18" do
        check_accessible_not_in 18, [10, 11, 12, 13, 14, 15, 16, 17]
      end

      it "Sets up Row 19" do
        check_accessible_in 19, [6, 9, 18, 21]
      end

      it "Sets up Row 20" do
        check_accessible_in 20, [6, 9, 18, 21]
      end

      it "Sets up Row 21" do
        check_accessible_in 21, [6, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 21]
      end

      it "Sets up Row 22" do
        check_accessible_in 22, [6, 12, 15, 21]
      end

      it "Sets up Row 23" do
        check_accessible_in 23, [6, 12, 15, 21]
      end

      it "Sets up Row 24" do
        check_accessible_not_in 24, [0, 7, 8, 13, 14, 19, 20, 27]
      end

      it "Sets up Row 25" do
        check_accessible_in 25, [1, 6, 9, 18, 21, 26]
      end

      it "Sets up Row 26" do
        check_accessible_in 26, [1, 6, 9, 18, 21, 26]
      end

      it "Sets up Row 27" do
        check_accessible_not_in 27, [0, 27]
      end

      it "Sets up Row 28" do
        check_accessible_in 28, [1, 6, 12, 15, 21, 26]
      end

      it "Sets up Row 29" do
        check_accessible_in 29, [1, 6, 12, 15, 21, 26]
      end

      it "Sets up Row 30" do
        check_accessible_in 30, [1, 6, 12, 15, 21, 26]
      end

      it "Sets up Row 31" do
        check_accessible_not_in 31, [0, 13, 14, 27]
      end

      it "Sets up Row 32" do
        @board.tiles[32].each_value do |tile|
          tile.accessible?.should be_false
        end
      end

      it "Sets up Row 33" do
        @board.tiles[33].each_value do |tile|
          tile.accessible?.should be_false
        end
      end

      it "Sets up Row 34" do
        @board.tiles[34].each_value do |tile|
          tile.accessible?.should be_false
        end
      end

      it "Sets up Row 35" do
        @board.tiles[35].each_value do |tile|
          tile.accessible?.should be_false
        end
      end

    end
  end
end
