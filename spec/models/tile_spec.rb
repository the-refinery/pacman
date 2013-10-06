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

end
