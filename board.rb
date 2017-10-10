require_relative "cursor"
require "colorize"
class Board

  attr_accessor :grid

  def initialize(grid= Array.new(8) {Array.new(8)} )
    @grid=grid
    populate
  end

  def populate
    @grid.each_with_index do |row, i|
      row.each_index do |j|
        if i < 2
          self[[i,j]] = Piece.new("  k  ",:black, [0,0])
        elsif i >1 && i < 6
          self[[i,j]] =  NullPiece.new("     ",:no,[5,5])
        else
          self[[i,j]] = Piece.new("  k  ",:black, [0,0])
        end
      end
    end
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, piece)
    row, col =pos
    @grid[row][col]= piece
  end

  def move_piece(start_pos, end_pos)
    raise ArgumentError.new("There is nothing at this position") if self[start_pos].nil?
    raise ArgumentError.new("There is already a piece at this position") if self[end_pos].nil?
  end

  def in_bounds?(pos)
    pos.all?{|n| n >= 0 && n <= 7}
  end

end


class Piece
  attr_reader :value, :color, :piece_pos
  def initialize(value, color, piece_pos)
    @value, @color, @piece_pos = value, color, piece_pos
  end
end

class NullPiece < Piece
  def moves()
  end
end
