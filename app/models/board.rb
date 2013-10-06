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
    ![0,27].include? y
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

  def row_7_accessible y
    [3, 6, 9, 18, 21, 24].include? y
  end

  def row_8_accessible y
    [3, 6, 9, 18, 21, 24].include? y
  end

  def row_9_accessible y
    ![1, 4, 5, 22, 23, 27].include? y
  end

  def row_10_accessible y
    [1, 6, 12, 15, 21, 26].include? y
  end

  def row_11_accessible y
    [1, 6, 12, 15, 21, 26].include? y
  end

  def row_12_accessible y
    ![1, 13, 14, 27].include? y
  end

  def row_13_accessible y
    [6, 9, 18, 21].include? y
  end

  def row_14_accessible y
    [6, 9, 18, 21].include? y
  end

  def row_15_accessible y
    [6, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 21].include? y
  end

  def row_16_accessible y
    [6, 9, 18, 21].include? y
  end

  def row_17_accessible y
    [6, 9, 18, 21].include? y
  end

  def row_18_accessible y
    ![10, 11, 12, 13, 14, 15, 16, 17].include? y
  end

end
