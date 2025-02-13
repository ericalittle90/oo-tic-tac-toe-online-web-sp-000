class TicTacToe

  attr_accessor :board, :index

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index=input.to_i - 1
  end

  def move(index, token="X")
    @board[index]=token
  end

  def position_taken?(index)
    @board[index]==" " ? false : true
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count%2==0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    token = current_player
    if valid_move?(index)
      move(index, token)
      display_board
    else turn
    end
  end

  def won?
       WIN_COMBINATIONS.detect do |combo|
       @board[combo[0]] == @board[combo[1]] &&
       @board[combo[1]] == @board[combo[2]] &&
       position_taken?(combo[0])
       end
   end

   def full?
         @board.all?{|i| i != " "}
    end

   def draw?
     !(won?) && (full?)
    end

    def over?
     won? || full? || draw?
    end

    def winner
      if won?
        @board[won?[0]]
      end
    end

    def play
      while !over? && turn_count<9
        turn
      end
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end
end
