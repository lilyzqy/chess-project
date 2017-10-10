require_relative "board"
require_relative "cursor"
require "colorize"

class Display

  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def render
    @board.grid.each_with_index do |row, i|
      row_render = ""
      row.each_index do |j|
        if (i + j).even?
          background = :yellow
        else
          background = :red
        end
        piece = @board[[i,j]]
        row_render << piece.value.colorize(:color => piece.color, :background => background)
      end
      puts row_render
    end


    @cursor.cursor_pos
  end
end
