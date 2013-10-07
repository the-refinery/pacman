require 'spec_helper'

describe Tile do

  context "Coordinates" do
    it "Initializes with the given coordinates" do
      tile = Tile.new 1, 5, true

      tile.x.should == 1
      tile.y.should == 5
    end
  end

  context "Accessible" do
    it "Initializes with accessibility" do
      tile = Tile.new 1, 5, true

      tile.accessible?.should be_true
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
      target = Tile.new 9, 14, true

      @source_tile.distance_to(target).should == 5
    end
  end


end
