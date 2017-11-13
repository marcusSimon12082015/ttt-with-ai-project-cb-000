module Players
  class Computer < Player
    WIN_COMBINATIONS = [
      [0,1,2],  # Top row
      [3,4,5],  # Middle row
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]
    ]
    def initialize(board)
      super
      @opponent = @token == "X" ? "O" : "X"
    end
    def minimax(board, player)
      availSpots = valid_moves(board)
      
    end
    def move(board)
      
      # move = nil
      # 
      #  # When going first, take the middle square. When going second, take the middle square if it isn't yet taken.
      #  if !board.taken?(5)
      #    move = "5"
      # 
      #  # If going second and the middle square is taken, take the upper-left corner square.
      #  elsif board.turn_count == 1
      #    move = "1"
      # 
      #  # If you went first (and took the middle), take a corner square with your second move.
      #  elsif board.turn_count == 2
      #    move = [1, 3, 7, 9].detect{|i| !board.taken?(i)}.to_s
      # 
      #  # If you went second (and took the middle) and the other player has occupied opposing corner squares, blow up the attempted trap by taking a side square.
      #  elsif board.turn_count == 3 && (board.position(1) == board.position(9) || board.position(3) == board.position(7))
      #    move = "2"
      # 
      #  # From here on, run through the WIN_COMBINATIONS array, checking whether any of the combinations have two squares filled with the same token and a third, empty square.
      #  else
      #    Game::WIN_COMBINATIONS.detect do |cmb|
      # 
      #      # First, check whether you have any chances to win, since it doesn't matter whether the opponent has a chance to win if you can win first.
      #      if cmb.select{|i| board.position(i+1) == token}.size == 2 && cmb.any?{|i| board.position(i+1) == " "}
      #        move = cmb.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
      # 
      #      # If you can't play any winning moves, play a move to block the opponent from winning.
      #      elsif cmb.select{|i| board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && cmb.any?{|i| board.position(i+1) == " "}
      #        move = cmb.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
      #      end
      #    end
      # 
      #    # If none of the WIN_COMBINATIONS patterns have two squares taken by the same token and a third empty square, play into the first open square you find, first checking corners and then checking sides.
      #    move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move == nil
      #  end
      #  move
    end
    def valid_moves(board)
      board.cells.each_index.select{|i| board.cells[i] == " "}
    end
    # def minmax(board,player)
    #   valid_array = valid_moves(board)
    #   if win_move?(board, @token)
    #
    #   elsif win_move?(board,@opponent)
    #
    #   elsif board.full?
    #
    #   end
    # end
    # def win_move?(board, token)
    #   temp_cells = board.cells
    #   valid_moves(board).detect do |indx|
    #     temp_cells[indx] = "#{token}"
    #     WIN_COMBINATIONS.detect {|line| line.all? {|i| temp_cells[i] == token}}
    #     temp_cells[indx] = " "
    #   end
    # end
  end
end
