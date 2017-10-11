require 'singleton'

module SteppingPiece
  def moves
    possible_end_pos = move_dirs.map do |pos|
      @piece_pos.map.with_index {|n,i| n + pos[i]}
    end
  end
end

class Piece
  attr_reader :color, :piece_pos

  def initialize( color, piece_pos)
     @color, @piece_pos = color, piece_pos
  end
end

class King < Piece
  include SteppingPiece

  def symbol
    "  ♚  "
  end

  def move_dirs
    possible_moves = [[-1, -1],[0, -1],[1,-1],
                      [-1, 0 ],       [1, 0],
                      [ 1, -1], [0, 1],[1, 1]]
  end
end

class Queen < Piece

  def symbol
    "  ♛  "
  end
end

class Bishop < Piece
  def symbol
    "  ♝  "
  end
end

class Knight < Piece
  include SteppingPiece

  def symbol
    "  ♞  "
  end

  def move_dirs
    possible_moves = [[-2,-1], [-2, 1], [-1, -2], [-1, 2], [1, -2], [2, -1], [2, 1],[1, 2]]
  end
end

class Pawn < Piece
  def symbol
    "  ♟  "
  end
end

class Rook < Piece
  def symbol
    "  ♜  "
  end
end

class NullPiece < Piece
  include Singleton

  attr_reader :color
  def initialize
    @color = :black
  end

  def symbol
    "     "
  end

  def moves
  end
end
