require_relative 'connect_four_move_tree.rb'

class ConnectFour

  def print_state
    puts ""
    puts @tree.to_s
    if !@tree.winner && @tree.last_move
      depth = 4
      puts ""
      puts "Minimax algorithm results for player #{@tree.player_to_move} with depth #{depth}:"
      @tree.last_move.children&.each do |child|
        # 0 = only look at my moves
        # 1 = look at my moves and his moves
        # 2 = look at my moves, his moves, and my move
        minimax = child.minimax(depth, true)
        puts "\tColumn #{child.column} score: #{minimax}"
      end
    end
  end

  def play
    @tree = ConnectFourMoveTree.new
    print_state

    while @tree.winner.nil?
      puts ""
      puts "move? (0 through 6 or nothing for computer)"
      next_move = gets.strip
      move = @tree.make_move(next_move)
      puts "move: #{move}"
      print_state
    end

    puts "Winner: #{@tree.winner}"
  end

end

ConnectFour.new.play
