require 'spec_helper'

describe Pacman do

  context "Setup" do
    before :each do
      @start_tile = Tile.new 9, 14, true
    end

    it "Initializes him to start at the given tile" do
      pacman = Pacman.new @start_tile

      pacman.location.row.should == 9
      pacman.location.column.should == 14
    end

    it "Initializes him to start in an non-moving state" do
      pacman = Pacman.new @start_tile

      pacman.direction.should == :none
    end

  end

  context "Movement" do
    before :each do
      @board = Board.new
    end

    context "Move to specific tile" do
      it "Moves to a new, accessible tile and sets the direction" do
        start = @board.tile_at 9, 14
        pacman = Pacman.new start

        success = pacman.move_to start.west, :west

        success.should be_true
        pacman.location.row.should == 9
        pacman.location.column.should == 13

        pacman.direction.should == :west
      end

      it "Moves to a new, accessible tile and does not change the direction" do
        start = @board.tile_at 9, 14
        step_1 = @board.tile_at 9, 1

        pacman = Pacman.new start
        pacman.move_to step_1, :east

        success = pacman.move_to step_1.east

        success.should be_true
        pacman.location.row.should == 9
        pacman.location.column.should == 2
        pacman.direction.should == :east
      end

      it "Does not move to an unaccesible tile" do
        start = @board.tile_at 9, 1
        target = @board.tile_at 9, 0

        pacman = Pacman.new start

        success = pacman.move_to target, :west

        success.should_not be_true
        pacman.location.row.should == 9
        pacman.location.column.should == 1

        pacman.direction.should == :none
      end
    end

    context "Move by ordinal" do
      before :each do
        @pacman = Pacman.new @board.tile_at 9, 14
      end

      it "Moves when target is accessible" do
        success = @pacman.move :east

        success.should be_true
        @pacman.location.row.should == 9
        @pacman.location.column.should == 15
        @pacman.direction.should == :east
      end

      it "Does not move when target is unaccessible" do
        success = @pacman.move :south

        success.should_not be_true
        @pacman.location.row.should == 9
        @pacman.location.column.should == 14
        @pacman.direction.should == :none
      end
    end


  end

end
