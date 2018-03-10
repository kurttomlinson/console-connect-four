require './connect_four_constants.rb'
require 'pry'

class ConnectFourMoveNode
	attr_accessor :parent
	attr_accessor :children
	attr_accessor :column
	attr_accessor :value
	attr_accessor :owner
	attr_accessor :player
	attr_accessor :board_state
	attr_accessor :winner

	def initialize(parent, column)
		@parent = parent
		@column = column
	end

	MAX_VALUE = +1000
	MIN_VALUE = -1000

	def minimax(depth, maximizing_player)
		if self.winner
			if maximizing_player
				maximizing_player_id = @owner
			else
				maximizing_player_id = (@owner == ConnectFourConstants::PLAYER_ONE) ? ConnectFourConstants::PLAYER_TWO : ConnectFourConstants::PLAYER_ONE
			end
			if self.winner == maximizing_player_id
				return MAX_VALUE
			else
				return MIN_VALUE
			end
		end

		return 0 if depth == 0

		if maximizing_player
			best_value = MAX_VALUE
			self.children.each do |child|
				child_value = child.minimax(depth - 1, false)
				best_value = [child_value, best_value].min
			end
			return best_value
		else
			best_value = MIN_VALUE
			self.children.each do |child|
				child_value = child.minimax(depth - 1, true)
				best_value = [child_value, best_value].max
			end
			return best_value
		end
	end



	def children
		# return the nodes for all valid moves
		return @children unless @children.nil?
		@children = generate_and_return_children
	end
	def winner
		# return 1 if player_one won. return 2 if player_two won. return nil otherwise.
		return @winner unless @winner.nil?
		@winner = determine_winner
	end
	def board_state
		# return an array where 1's represent player_one's moves,
		# 2's represent player_two's moves,
		# and nil represents free spaces
		return @board_state unless @board_state.nil?
		@board_state = generate_and_return_board_state
	end

	def to_s
		{ column: @column, owner: @owner }.to_s
	end

	private

	def calculate_and_return_value
		# +1:
	end

	def determine_winner
		winner = nil
		(0..ConnectFourConstants::COLUMNS-1).each do |start_column|
			(0..ConnectFourConstants::ROWS-1).each do |start_row|
				next if self.board_state[start_column][start_row].nil?
				# NORTH
				begin
					winner = self.board_state[start_column][start_row] if self.board_state[start_column][start_row] == self.board_state[start_column + 0][start_row + 1] && self.board_state[start_column][start_row] == self.board_state[start_column + 0][start_row + 2] && self.board_state[start_column][start_row] == self.board_state[start_column + 0][start_row + 3]
				rescue
				end
				# NORTH-EAST
				begin
					winner = self.board_state[start_column][start_row] if self.board_state[start_column][start_row] == self.board_state[start_column + 1][start_row + 1] && self.board_state[start_column][start_row] == self.board_state[start_column + 2][start_row + 2] && self.board_state[start_column][start_row] == self.board_state[start_column + 3][start_row + 3]
				rescue
				end
				# EAST
				begin
					winner = self.board_state[start_column][start_row] if self.board_state[start_column][start_row] == self.board_state[start_column + 1][start_row + 0] && self.board_state[start_column][start_row] == self.board_state[start_column + 2][start_row + 0] && self.board_state[start_column][start_row] == self.board_state[start_column + 3][start_row + 0]
				rescue
				end
				# SOUTH-EAST
				begin
					winner = self.board_state[start_column][start_row] if self.board_state[start_column][start_row] == self.board_state[start_column + 1][start_row - 1] && self.board_state[start_column][start_row] == self.board_state[start_column + 2][start_row - 2] && self.board_state[start_column][start_row] == self.board_state[start_column + 3][start_row - 3]
				rescue
				end
				return winner if winner
			end
		end
		return nil
	end

	def generate_and_return_board_state
		moves = Array.new
		node = self
		while !node.nil?
			moves.unshift(node.column)
			node = node.parent
		end
		board_state = Array.new(ConnectFourConstants::COLUMNS) { Array.new(ConnectFourConstants::ROWS) }
		current_player = ConnectFourConstants::PLAYER_ONE
		moves.each do |move_column|
			y_position = board_state[move_column].index(nil)
			board_state[move_column][y_position] = current_player
			current_player = (current_player == ConnectFourConstants::PLAYER_ONE) ? ConnectFourConstants::PLAYER_TWO : ConnectFourConstants::PLAYER_ONE
		end
		return board_state
	end

	def generate_and_return_children
		return nil unless self.winner.nil?
		children = Array.new
		parents_per_column.each_with_index do |parent_count, column|
			if parent_count < ConnectFourConstants::ROWS - 1
				child = ConnectFourMoveNode.new(self, column)
				child.owner = (@owner == ConnectFourConstants::PLAYER_ONE) ? ConnectFourConstants::PLAYER_TWO : ConnectFourConstants::PLAYER_ONE
				children.push(child)
			end
		end
		return children
	end

	def parents_per_column
		ancestor = parent
		parents_count = Array.new(ConnectFourConstants::COLUMNS, 0)
		while !ancestor.nil?
			parents_count[ancestor.column] += 1
			ancestor = ancestor.parent
		end
		return parents_count
	end
end