module Chess
  class Position
    def initialize(position)
      @position = position.downcase
    end

    def to_s; @position; end
    def ==(position); @position == position.to_s; end

    def column; @position[0]; end
    def row; @position[1]; end

    def bottom_square
      if row == "1"
        nil
      else
        Position.new column + (row.ord - 1).chr
      end
    end

    def top_square
      if row == "8"
        nil
      else
        Position.new column + (row.ord + 1).chr
      end
    end

    def left_square
      if column == "a"
        nil
      else
        Position.new (column.ord - 1).chr + row
      end
    end

    def right_square
      if column == "h"
        nil
      else
        Position.new (column.ord + 1).chr + row
      end
    end

    alias_method :down_square, :bottom_square
    alias_method :up_square, :top_square

    %i{bottom top left right down up}.each do |square_name|
      alias_method square_name, (square_name.to_s + "_square").to_sym
    end
  end
end
