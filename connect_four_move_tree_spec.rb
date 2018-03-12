require 'rspec'
require './connect_four_move_tree.rb'

describe 'ConnectFourMoveTree#load_game' do
	it 'loads a game from an array of moves' do
		tree = ConnectFourMoveTree.new
		tree.load_game([0,1,0,1,0,1,0])
		expect(tree.winner).to be == ConnectFourConstants::PLAYER_ONE
	end
end

describe 'ConnectFourMoveTree#export_game' do
	it 'exports a game to an array of moves' do
		tree = ConnectFourMoveTree.new
		moves = [0,1,2,3,4,5,6]
		moves.each do |move|
			tree.make_move(move)
		end
		exported_moves = tree.export_game
		expect(exported_moves.length).to be == moves.length
		moves.each_with_index do |move, index|
			expect(exported_moves[index]).to be == move
		end
	end
end

describe 'ConnectFourMoveTree#make_move' do
  it 'throws an error when a column overflows' do
  	tree = ConnectFourMoveTree.new
  	tree.make_move(0)
  	tree.make_move(0)
  	tree.make_move(0)
  	tree.make_move(0)
  	tree.make_move(0)
  	tree.make_move(0)
  	expect{ tree.make_move(0) }.to raise_error 'column overflow'
	end
  it 'throws an error when given a negative column' do
  	tree = ConnectFourMoveTree.new
  	expect{ tree.make_move(-1) }.to raise_error 'columns must be between 0 and 6'
	end
  it 'throws an error when given a column that is too big' do
  	tree = ConnectFourMoveTree.new
  	expect{ tree.make_move(ConnectFourConstants::COLUMNS) }.to raise_error 'columns must be between 0 and 6'
	end
  it 'accepts six moves per column' do
  	(0..ConnectFourConstants::COLUMNS-2).each do |column|
  		tree = ConnectFourMoveTree.new
	  	tree.make_move(column)
	  	tree.make_move(column)
	  	tree.make_move(column)
	  	tree.make_move(column)
	  	tree.make_move(column)
	  	expect{ tree.make_move(column) }.to_not raise_error
	  end
	end
end
