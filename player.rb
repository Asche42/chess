require_relative 'piece'
require_relative 'pawn'
require_relative 'rook'
require_relative 'bishop'
require_relative 'knight'
require_relative 'king'
require_relative 'queen'

module Chess
  class Player
    attr_reader :pieces, :color

    @@white_player = nil
    @@black_player = nil

    @@human_player = nil
    @@ai_player = nil

    def initialize(color, player_type)
      @pieces = []
      @color = color

      if color == :white and @@white_player.nil?
        @pieces += %i{rook knight bishop queen king bishop knight rook}.each_with_index.map{ |sym,i| Object.const_get("Chess::" + sym.to_s.capitalize).new((97 + i).chr + "1", :white) }
        @pieces += %i{pawn pawn pawn pawn pawn pawn pawn pawn }.each_with_index.map{ |sym,i| Object.const_get("Chess::" + sym.to_s.capitalize).new((97 + i).chr + "2", :white) }
        @@white_player = self
      elsif color == :black and @@black_player.nil?
        @pieces += %i{pawn pawn pawn pawn pawn pawn pawn pawn }.each_with_index.map{ |sym,i| Object.const_get("Chess::" + sym.to_s.capitalize).new((97 + i).chr + "7", :black) }
        @pieces += %i{rook knight bishop queen king bishop knight rook}.each_with_index.map{ |sym,i| Object.const_get("Chess::" + sym.to_s.capitalize).new((97 + i).chr + "8", :black) }
        @@black_player = self
      else
        raise TooManyPlayersException
      end

      if player_type == :ai and @@ai_player.nil?
        @@ai_player = self
      elsif player_type == :human and @@human_player.nil?
        @@human_player = self
      else
        raise TooManyPlayersException
      end
    end

    def self.white; @@white_player; end
    def self.black; @@black_player; end

    def self.human; @@human_player; end
    def self.ai; @@ai_player; end
  end
end
