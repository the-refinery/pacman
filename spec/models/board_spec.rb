require 'spec_helper'

describe Board do
  def tile_at row, column
    @board.tiles[row][column]
  end

  def check_accessible_in row, columns
    0.step(27) do |i|
      if columns.include? i
        tile_at(row, i).accessible?.should be_true
      else
        tile_at(row, i).accessible?.should be_false
      end
    end
  end

  def check_accessible_not_in row, columns
    0.step(27) do |i|
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
      tile.row.should == 4
      tile.column.should == 26
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

    context "Defines Routes" do

      it "Defines East-West paths" do
        target = tile_at 3, 6

        target.north.should be_nil

        target.south.should be_nil

        target.east.should_not be_nil
        target.east.row.should == 3
        target.east.column.should == 7

        target.west.should_not be_nil
        target.west.row.should == 3
        target.west.column.should == 5
      end

      it "Defines North-South paths" do
        target = tile_at 15, 6

        target.north.should_not be_nil
        target.north.row.should == 16
        target.north.column.should == 6

        target.south.should_not be_nil
        target.south.row.should == 14
        target.south.column.should == 6

        target.east.should be_nil

        target.west.should be_nil
      end

      it "Defines North-East turns" do
        target = tile_at 6, 9

        target.north.should_not be_nil
        target.north.row.should == 7
        target.north.column.should == 9

        target.south.should be_nil

        target.east.should_not be_nil
        target.east.row.should == 6
        target.east.column.should == 10

        target.west.should be_nil
      end

      it "Defines North-West turns" do
        target = tile_at 6, 6

        target.north.should_not be_nil
        target.north.row.should == 7
        target.north.column.should == 6

        target.south.should be_nil

        target.east.should be_nil

        target.west.should_not be_nil
        target.west.row.should == 6
        target.west.column.should == 5
      end

      it "Defines South-East turns" do
        target = tile_at 9, 24

        target.north.should be_nil

        target.south.should_not be_nil
        target.south.row.should == 8
        target.south.column.should == 24

        target.east.should_not be_nil
        target.east.row.should == 9
        target.east.column.should == 25

        target.west.should be_nil
      end

      it "Defines South-West turns" do
        target = tile_at 9, 3

        target.north.should be_nil

        target.south.should_not be_nil
        target.south.row.should == 8
        target.south.column.should == 3

        target.east.should be_nil

        target.west.should_not be_nil
        target.west.row.should == 9
        target.west.column.should == 2
      end

      it "Defines East-West-North intersections" do
        target = tile_at 3, 12

        target.north.should_not be_nil
        target.north.row.should == 4
        target.north.column.should == 12

        target.south.should be_nil

        target.east.should_not be_nil
        target.east.row.should == 3
        target.east.column.should == 13

        target.west.should_not be_nil
        target.west.row.should == 3
        target.west.column.should == 11
      end

      it "Defines East-West-South intersections" do
        target = tile_at 31, 6

        target.north.should be_nil

        target.south.should_not be_nil
        target.south.row.should == 30
        target.south.column.should == 6

        target.east.should_not be_nil
        target.east.row.should == 31
        target.east.column.should == 7

        target.west.should_not be_nil
        target.west.row.should == 31
        target.west.column.should == 5
      end

      it "Defines North-South-East intersections" do
        target = tile_at 27, 1

        target.north.should_not be_nil
        target.north.row.should == 28
        target.north.column.should == 1

        target.south.should_not be_nil
        target.south.row.should == 26
        target.south.column.should == 1

        target.east.should_not be_nil
        target.east.row.should == 27
        target.east.column.should == 2

        target.west.should be_nil
      end

      it "Defines North-South-West intersections" do
        target = tile_at 27, 26

        target.north.should_not be_nil
        target.north.row.should == 28
        target.north.column.should == 26

        target.south.should_not be_nil
        target.south.row.should == 26
        target.south.column.should == 26

        target.east.should be_nil

        target.west.should_not be_nil
        target.west.row.should == 27
        target.west.column.should == 25
      end

      it "Defines cross intersections" do
        target = tile_at 18, 6

        target.north.should_not be_nil
        target.north.row.should == 19
        target.north.column.should == 6

        target.south.should_not be_nil
        target.south.row.should == 17
        target.south.column.should == 6

        target.east.should_not be_nil
        target.east.row.should == 18
        target.east.column.should == 7

        target.west.should_not be_nil
        target.west.row.should == 18
        target.west.column.should == 5
      end

      it "Defines the wrap-around tunnel" do
        west_side = tile_at 18, 0
        east_side = tile_at 18, 27

        west_side.west.should_not be_nil
        west_side.west.row.should == 18
        west_side.west.column.should == 27

        east_side.east.should_not be_nil
        east_side.east.row.should == 18
        east_side.east.column.should == 0
      end

    end

  end

  context "Tils accessibility" do

    it "Returns the tile at the specified row and column" do
      tile = @board.tile_at 5, 10

      tile.should == @board.tiles[5][10]
    end

    it "Returns nil of the requested row/column is below the board" do
      tile =  @board.tile_at -1, 10

      tile.should be_nil
    end

    it "Returns nil of the requested row/column is above the board" do
      tile =  @board.tile_at 40, 10

      tile.should be_nil
    end

    it "Returns nil of the requested row/column is to the left of the board" do
      tile =  @board.tile_at 5, -1

      tile.should be_nil
    end

    it "Returns nil of the requested row/column is to the right of the board" do
      tile =  @board.tile_at 5, 40

      tile.should be_nil
    end

  end

end
