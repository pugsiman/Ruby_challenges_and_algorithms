class Board
  def initialize
    @board = create_board
    # @knight = Knight.new('X')
  end

  def create_board
    board = []
    8.times do
      board << '___ ' * 8
    end
    board
  end

  def display_board
    num_count = 8
    print '   ', ('a'..'h').to_a.join('   '), "\n"
    @board.each do |row|
      print "#{num_count}|"
      puts row
      puts ' |' unless num_count == 1
      num_count -= 1
    end
  end
end

# test = Board.new
# test.display_board
Move = Struct.new(:position, :path)

def knight_moves(starts, ends)

end
