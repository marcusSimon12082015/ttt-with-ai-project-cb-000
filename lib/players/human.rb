module Players
  class Human < Player
    def initialize(board)
      super
    end
    def move(board)
      board.display
      puts "Please enter position 1-9 for your move."
      gets
    end
  end
end
