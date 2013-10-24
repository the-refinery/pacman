module BoardHelper

  def display_tile_at row, column
    tile = @board.tile_at row, column

    content = "&nbsp;"

    if @show_pacman && @board.pacman.location == tile
      content = case  @board.pacman.direction
                when :north then "&uarr;"
                when :south then "&darr;"
                when :east then "&rarr;"
                when :west then "&larr;"
                else "&mdash;"
                end
    end

    content.html_safe
  end

  def class_for_tile_at row, column
    tile = @board.tile_at row, column

    css_class = "unavailable"

    if tile.accessible?
      css_class = "available"

      if @show_pacman && @board.pacman.location == tile
        css_class << ' pacman'
      end

      if @highlight_intersection && tile.intersection?
        css_class << ' highlight'
      end

      if @highlight_special
        special_tiles = [
          @board.tile_at(9, 12),
          @board.tile_at(9, 15),
          @board.tile_at(21, 12),
          @board.tile_at(21, 15)
        ]

        if special_tiles.include? tile
          css_class << ' highlight'
        end
      end

    end

    css_class

  end

end
