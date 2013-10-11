class Pacman

  attr_reader :location, :direction

  def initialize start_tile
    @location = start_tile
    @direction = :none
  end

  def move_to target, direction=nil

    if target.accessible?
      @location = target

      unless direction.nil?
        @direction = direction
      end

      true
    end

  end

  def move direction

    target = @location.send(direction)

    unless target.nil?
      move_to target, direction
    end

  end

end
