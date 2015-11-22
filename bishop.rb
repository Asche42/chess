require_relative 'piece'

module Chess
  class Bishop
    include Piece

    def symbol(color)
      case color
      when :black
        "♝"
      when :white
        "♗"
      end
    end
  end
end
