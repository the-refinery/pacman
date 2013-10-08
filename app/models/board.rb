class Board

  attr_reader :tiles

  def initialize
    setup_tiles
  end

  def setup_tiles
    @tiles = Hash.new

    map = setup_map

    for i in 0..35
      setup_tile_row i, map
    end
  end

  def setup_tile_row row, map
    @tiles[row] = Hash.new

    for i in 0..27
      @tiles[row][i] = Tile.new row, i, compute_accessible_for(row, i, map)
    end
  end

  def compute_accessible_for row, column, map
    if map.has_key? row
      map[row].available? column
    else
      method = "row_#{row}_accessible"

      if self.respond_to? method
        self.send(method.to_sym, column)
      else
        false
      end
    end
  end

  def setup_map
    map = Hash.new

    map[0] = Row.new []
    map[1] = Row.new []
    map[2] = Row.new []
    map[3] = Row.new [0,27], false
    map[4] = Row.new [1,12,15,27]
    map[5] = Row.new [1,12,15,27]
    map[6] = Row.new [0, 7, 8, 13, 14, 19, 20, 27], false
    map[7] = Row.new [3, 6, 9, 18, 21, 24]
    map[8] = Row.new [3, 6, 9, 18, 21, 24]
    map[9] = Row.new [0, 4, 5, 22, 23, 27], false
    map[10] = Row.new [1, 6, 12, 15, 21, 26]
    map[11] = Row.new [1, 6, 12, 15, 21, 26]
    map[12] = Row.new [0, 13, 14, 27], false
    map[13] = Row.new [6, 9, 18, 21]
    map[14] = Row.new [6, 9, 18, 21]
    map[15] = Row.new [6, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 21]
    map[16] = Row.new [6, 9, 18, 21]
    map[17] = Row.new [6, 9, 18, 21]
    map[18] = Row.new [10, 11, 12, 13, 14, 15, 16, 17], false
    map[19] = Row.new [6, 9, 18, 21]
    map[20] = Row.new [6, 9, 18, 21]
    map[21] = Row.new [6, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 21]
    map[22] = Row.new [6, 12, 15, 21]
    map[23] = Row.new [6, 12, 15, 21]
    map[24] = Row.new [0, 7, 8, 13, 14, 19, 20, 27], false
    map[25] = Row.new [1, 6, 9, 18, 21, 26]
    map[26] = Row.new [1, 6, 9, 18, 21, 26]
    map[27] = Row.new [0,27], false
    map[28] = Row.new [1, 6, 12, 15, 21, 26]
    map[29] = Row.new [1, 6, 12, 15, 21, 26]
    map[30] = Row.new [1, 6, 12, 15, 21, 26]
    map[31] = Row.new [0, 13, 14, 27], false
    map[32] = Row.new []
    map[33] = Row.new []
    map[34] = Row.new []
    map[35] = Row.new []

    map
  end

  class Row

    attr_reader :cells, :inclusive

    def initialize cells, inclusive=true
      @cells = cells
      @inclusive = inclusive
    end

    def available? column
      if @inclusive
        cells.include? column
      else
        !cells.include? column
      end
    end
  end

end
