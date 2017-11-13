require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2
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
  def initialize(player1=Players::Human.new("X"),player2=Players::Human.new("O"),board=Board.new)
    @board = board
    @player_1 = player1
    @player_2 = player2
  end
  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
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
      combo.all? {|indx| @board.cells[indx] == "X"} || combo.all? {|indx| @board.cells[indx] == "O"}
    end
  end
  def winner
    @board.cells[won?.first] if won?
  end
  def turn
    move = current_player.move(@board)
    @board.valid_move?(move) ? @board.update(move,current_player) : turn
  end
  def play
    while !over? do turn end
    won? ? (puts "Congratulations #{winner}!") : (puts "Cat's Game!")
  end
  def self.start
    puts "Welcome to Tic Tac Toe!"
    loop do
      puts "What kind of game would you like to play?"
      puts "0 - computer vs computer"
      puts "1 - human vs computer"
      puts "2 - human vs human"
      puts "Type exit to quit!"
      type_of_game = gets.strip
      if  ["exit","0","1","2"].detect{|element| element == type_of_game} != nil
        break if type_of_game == "exit"
        game = Game.new(Players::Computer.new("X"),Players::Computer.new("O")) if type_of_game == "0"
          if type_of_game == "1"
            loop do
            end_loop = false
            puts "Who should go first? 1 - Computer |-|-| 2 - Human?"
                go_first = gets.strip
                if ["1","2"].detect{|element| element == go_first} != nil
                  if go_first == "1"
                    game = Game.new(Players::Computer.new("X"), Players::Human.new("O"))
                  else
                    game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
                  end
                  end_loop = true
                end
                break if end_loop
              end
          end
          game = Game.new if type_of_game == "2"
          game.play
      end
    end
  end
end
