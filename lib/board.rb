class Board
  attr_accessor :cells
  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]
  def initialize
    @cells = Array.new(9," ")
  end
  def reset!
    @cells = Array.new(9," ")
  end
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  def position(input)
    @cells[input.to_i-1]
  end
  def full?
    @cells.all? { |token| token == "X" || token == "O" }
  end
  def turn_count
    @cells.count{|token| token == "X" || token == "O"}
  end
  def taken?(index)
    !(@cells[index.to_i-1].nil? || @cells[index.to_i-1] == " ")
  end
  def valid_move?(index)
    index = index.to_i
    if index.is_a? Integer
      index.between?(1,9) && !taken?(index)
    else
      false
    end
  end
  def update(index,player)
    @cells[index.to_i-1] = player.token
  end
  def draw?
    @board.full? && !won?
    #binding.pry
  end
  def over?
    won? || draw?
  end
  def won?
    WIN_COMBINATIONS.detect do |combo|
      combo.all? {|indx| @cells[indx] == "X"} || combo.all? {|indx| @cells[indx] == "O"}
    end
  end
  def winner
    @cells[won?.first] if won?
  end
end
