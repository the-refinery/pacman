class Board

  attr_reader :tiles

  def initialize
    setup_tiles
  end

private

  def setup_tiles
    @tiles = Hash.new

    for i in 0..27 
      setup_tile_row i
    end
  end

  def setup_tile_row row
    @tiles[row] = Hash.new

    for i in 0..35
      @tiles[row][i] = Tile.new row, i, compute_accessible_for(row, i)
    end
  end

  def compute_accessible_for x, y
    false
  end

end
