require_relative 'exceptions'
require_relative 'position'

module Chess
  module Piece
    attr_reader :name
    attr_reader :position

    def initialize(position, color)
      @name = self.class.name
      @position = Position.new position
      @color = color
    end

    def to_s
      "#{@name} to player #{@color} is at #{@position}."
    end

    def update_position(position)
      if available_positions.select{ |e| e == position }
        @position = position
      else
        # This is a safeguard for the players, as the AI is supposed
        # to be choosing valid moves.
        # The exception enables us to process the interruption some
        # place else rather than displaying a message right here.
        raise InvalidMoveException
      end
    end

    alias_method :move, :update_position

    # To be implemented in daughter classes.
    # Full list: Pawn, Rook, Knight, Bishop, Queen, King.
    def available_positions; raise NotImplementedError; end
    def symbol(color); raise NotImplementedError; end
  end
end

