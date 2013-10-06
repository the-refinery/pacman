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

end
