class Tile

  attr_reader :x, :y

  def initialize x, y, accessible
    @x = x
    @y = y

    @accessible = accessible
  end

  def accessible?
    @accessible
  end

  def distance_to target_tile 
    a = (@x - target_tile.x).abs
    b = (@y - target_tile.y).abs

    Math.sqrt(a**2 + b**2)
  end

end
