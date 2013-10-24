require 'spec_helper'

describe Tile do

  context "Coordinates" do
    it "Initializes with the given coordinates" do
      tile = Tile.new 1, 5, true

      tile.row.should == 1
      tile.column.should == 5
    end
  end

  context "Accessible" do
    it "Initializes with accessibility" do
      tile = Tile.new 1, 5, true

      tile.accessible?.should be_true
    end
  end

  context "Intersection" do
    it "Identifies itself if it's an intersection" do
      tile = Tile.new 12, 3, true
      tile.north = Tile.new 12, 4, true
      tile.south = Tile.new 12, 2, false
      tile.east = Tile.new 13, 3, true
      tile.west = Tile.new 11, 3, true

      tile.intersection?.should be_true
    end

    it "Does not identify itself if it's not an intersection" do
      tile = Tile.new 11, 3, true
      tile.north = Tile.new 11, 4, false
      tile.south = Tile.new 11, 2, false
      tile.east = Tile.new 12, 3, true
      tile.west = Tile.new 10, 3, true

      tile.intersection?.should_not be_true
    end
  end

  context "Computes the distance to a given tile" do
    before :each do
      @source_tile = Tile.new 6, 9, true
    end

    it "Computes to a tile due East" do
      target = Tile.new 16, 9, true

      @source_tile.distance_to(target).should == 10
    end

    it "Computes to a tile due West" do
      target = Tile.new 1, 9, true

      @source_tile.distance_to(target).should == 5
    end

    it "Computes to a tile due North" do
      target = Tile.new 6, 18, true

      @source_tile.distance_to(target).should == 9
    end

    it "Computes to a tile due South" do
      target = Tile.new 6, 3, true

      @source_tile.distance_to(target).should == 6
    end

    it "Computes to a tile to the North East" do
      target = Tile.new 9, 13, true

      @source_tile.distance_to(target).should == 5
    end

    it "Computes to a tile to the North West" do
      target = Tile.new 9, 5, true

      @source_tile.distance_to(target).should == 5
    end

    it "Computes to a tile to the South East" do
      target = Tile.new 3, 13, true

      @source_tile.distance_to(target).should == 5
    end

    it "Computes to a tile to the South West" do
      target = Tile.new 3, 5, true

      @source_tile.distance_to(target).should == 5
    end
  end


end
