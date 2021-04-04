class TicTacToe

attr_accessor :board, :index

  def intialize(board = nil)
    @board = board || Array.new(9, " ")
  end

end 
