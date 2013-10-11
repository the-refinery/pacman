module BoardHelper

  def display_tile_at row, column

    tile = @board.tile_at row, column

    if tile.accessible?
      if @board.pacman.location == tile
        'P'
      else
        ' '
      end
    else
      'X'
    end

  end

end
