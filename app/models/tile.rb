class Tile

  attr_reader :row, :column
  attr_accessor :north, :south, :east, :west

  def initialize row, column, accessible
    @row = row
    @column = column

    @accessible = accessible
  end

  def accessible?
    @accessible
  end

  def distance_to target_tile 
    a = (@row - target_tile.row).abs
    b = (@column - target_tile.column).abs

    Math.sqrt(a**2 + b**2)
  end

  def inspect
    "<Tile:#{object_id}, row: #{@row}, column: #{@column}, accessible: #{@accessible}>"
  end

end
