require_relative 'player.rb'

module Chess
  class Board
    def initialize(white_player, black_player)
      @white_player = Chess::Player.new(:white, white_player)
      @black_player = Chess::Player.new(:black, black_player)
    end

    def get_piece_at(position)
      selected_piece = @white_player.pieces.select{ |piece| piece.position == position }
      selected_piece = @black_player.pieces.select{ |piece| piece.position == position } if selected_piece.empty?
      return (selected_piece.empty?) ? nil : selected_piece
    end

    def to_s
      board = {}

      @white_player.pieces.each{ |piece| board[piece.position.to_s] = piece.symbol(:white) }
      @black_player.pieces.each{ |piece| board[piece.position.to_s] = piece.symbol(:black) }

      str = "   a b c d e f g h\n\n"
      ("1".."8").to_a.reverse.each do |row|
        str += "#{row} "
        ("a".."h").to_a.reverse.each do |column|
          str += " "
          str += board[column + row] || " "
        end
        str += "   #{row}\n"
      end
      str += "\n   a b c d e f g h\n"

      str
    end
  end
end
