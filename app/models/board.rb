class Board

  attr_reader :tiles

  def initialize
    setup_tiles
  end

  def setup_tiles
    @tiles = Hash.new

    for i in 0..35
      setup_tile_row i
    end
  end

  def setup_tile_row row
    @tiles[row] = Hash.new

    for i in 0..27
      @tiles[row][i] = Tile.new row, i, compute_accessible_for(row, i)
    end
  end

  def compute_accessible_for x, y
    method = "row_#{x}_accessible"

    if self.respond_to? method
      self.send(method.to_sym, y)
    else
      false
    end

  end

  def row_0_accessible y
    false
  end

  def row_1_accessible y
    false
  end

  def row_2_accessible y
    false
  end

  def row_3_accessible y
    if y == 0 || y == 27
      false
    else
      true
    end
  end

  def row_4_accessible y
    [1,12,15,27].include? y
  end

  def row_5_accessible y
    [1,12,15,27].include? y
  end

  def row_6_accessible y
    ![0, 7, 8, 13, 14, 19, 20, 27].include? y
  end

end
