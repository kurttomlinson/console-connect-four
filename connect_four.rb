require './connect_four_move_tree.rb'

class ConnectFour

	def self.play
		tree = ConnectFourMoveTree.new

		# tree.make_move(0)
		# tree.make_move(0)
		# tree.make_move(1)
		# tree.make_move(5)
		# tree.make_move(2)
		# tree.make_move(5)
		# tree.make_move(3)

		while tree.winner.nil?
			next_move = gets.to_i
			tree.make_move(next_move)
			puts tree.to_s
			puts "Minimax for player #{tree.player_to_move}:"
			tree.last_move.children&.each do |child|
				# 0 = only look at my moves
				# 2 = look at my moves and his moves
				# 2 = look at my moves, his moves, and my move
				minimax = child.minimax(1, true)
				puts "\tchild.column: #{child.column}; minimax: #{minimax}"
			end
		end

		puts "tree.winner: #{tree.winner}"
	end

end

ConnectFour.play
