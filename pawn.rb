require_relative 'piece'

module Chess
  class Pawn
    include Piece

    def initialize(position, color)
      @already_played = false
      super(position, color)
    end

    def update_position(position)
      @already_played = true
      super(position)
    end

    def available_positions
      next_positions = []

      if @color == :white and @already_played
        next_positions << position.up
      elsif @color == :white
        next_positions << position.up.up
      elsif @color == :black and @already_played
        next_positions << position.down
      else
        next_positions << position.down.down
      end

      next_positions
    end

    def symbol(color)
      case color
      when :black
        "♟"
      when :white
        "♙"
      end
    end
  end
end

