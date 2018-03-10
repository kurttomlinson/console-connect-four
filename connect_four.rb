require './connect_four_move_tree.rb'

class ConnectFour

  def print_state
    puts @tree.to_s
    puts "Minimax for player #{@tree.player_to_move}:"
    unless @tree.winner
      @tree.last_move.children&.each do |child|
        # 0 = only look at my moves
        # 1 = look at my moves and his moves
        # 2 = look at my moves, his moves, and my move
        minimax = child.minimax(5, true)
        puts "\tchild.column: #{child.column}; minimax: #{minimax}"
      end
    end
  end

	def play
		@tree = ConnectFourMoveTree.new

		# @tree.make_move(0)
		# @tree.make_move(0)
		# @tree.make_move(1)
		# @tree.make_move(5)
		# @tree.make_move(2)
		# @tree.make_move(5)
		# @tree.make_move(3)

    # @tree.make_move(0)
    # @tree.make_move(1)
    # @tree.make_move(0)
    # @tree.make_move(1)
    # @tree.make_move(0)


		while @tree.winner.nil?
			next_move = gets.to_i
			@tree.make_move(next_move)
      print_state
		end

		puts "@tree.winner: #{@tree.winner}"
	end

end

ConnectFour.new.play
