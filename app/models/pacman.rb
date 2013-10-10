class Pacman

  attr_reader :location, :direction

  def initialize start_tile
    @location = start_tile
    @direction = :none
  end

  def move target, direction=nil

    @location = target

    unless direction.nil?
      @direction = direction
    end

  end

end
