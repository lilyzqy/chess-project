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
          self[[i,j]] = Piece.new
        elsif i >1 && i < 6
          self[[i,j]] =  NullPiece.new
        else
          self[[i,j]] = Piece.new
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

end


class Piece
end

class NullPiece < Piece
  def moves()
  end
end
