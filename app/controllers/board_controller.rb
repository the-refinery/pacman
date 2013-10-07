class BoardController < ApplicationController

  def show
    @board = Board.new
  end

end
