require_relative "cursor"
require "colorize"
require_relative "pieces"
class Board

  attr_accessor :grid

  def initialize(grid= Array.new(8) {Array.new(8)} )
    @grid=grid
    populate
  end

  def populate
    @grid.each_with_index do |row, i|
      if i == 0
        self[[i,0]] = Rook.new(:black,[0,0])
        self[[i,1]] = Knight.new(:black,[0,1])
        self[[i,2]] = Bishop.new(:black,[0,2])
        self[[i,3]] = Queen.new(:black,[0,3])
        self[[i,4]] = King.new(:black,[0,4])
        self[[i,5]] = Bishop.new(:black,[0,5])
        self[[i,6]] = Knight.new(:black,[0,6])
        self[[i,7]] = Rook.new(:black,[0,7])
      elsif i == 1
        row.each_index do |j|
          self[[i,j]] = Pawn.new(:black,[i,j])
        end
      elsif i >1 && i < 6
        row.each_index do |j|
          self[[i,j]] =  NullPiece.instance
        end
      elsif i == 6
        row.each_index do |j|
          self[[i,j]] = Pawn.new(:white,[i,j])
        end
      elsif i == 7
        self[[i,0]] = Rook.new(:white,[0,0])
        self[[i,1]] = Knight.new(:white,[0,1])
        self[[i,2]] = Bishop.new(:white,[0,2])
        self[[i,3]] = Queen.new(:white,[0,3])
        self[[i,4]] = King.new(:white,[0,4])
        self[[i,5]] = Bishop.new(:white,[0,5])
        self[[i,6]] = Knight.new(:white,[0,6])
        self[[i,7]] = Rook.new(:white,[0,7])
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

  def valid_move?(end_pos,piece)
    return false if !piece.moves.include?(end_pos)
    return false if !in_bounds?(end_pos)
    return false if board[end_pos].color == piece.color && board[end_pos].symbol != "null"
  end

end
