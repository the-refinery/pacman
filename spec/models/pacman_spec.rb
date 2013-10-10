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

    it "Moves to a new, accessible tile and sets the direction" do
      board = Board.new
      start = board.tile_at 9, 14
      pacman = Pacman.new start

      pacman.move_to start.west, :west

      pacman.location.row.should == 9
      pacman.location.column.should == 13
      pacman.direction.should == :west
    end


  end

end
