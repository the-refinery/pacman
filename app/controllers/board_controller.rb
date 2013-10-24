class BoardController < ApplicationController

  def show
    @board = Board.new

    if params[:pacman]
      @show_pacman = true

      movement = params[:pacman].split(",")

      row = movement[0].to_i
      column = movement[1].to_i

      direction = case  movement[2]
                  when "n" then :north
                  when "s" then :south
                  when "e" then :east
                  when "w" then :west
                  else nil
                  end

      tile = @board.tile_at row, column
      @board.pacman.move_to tile, direction
    end

    if params[:show_pacman] == "t"
      @show_pacman = true
    end

    if params[:highlight] == "intersection"
      @highlight_intersection = true
    end

    if params[:highlight] == "special"
      @highlight_special = true
    end

  end

end
