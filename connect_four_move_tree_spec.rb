require 'rspec'
require './connect_four_move_tree.rb'

describe 'MinesweeperPoint#initialize' do
  it 'throws an error when a column overflows' do
  	tree = ConnectFourMoveTree.new
  	tree.make_move(0)
  	tree.make_move(0)
  	tree.make_move(0)
  	tree.make_move(0)
  	tree.make_move(0)
  	tree.make_move(0)
  	expect{ tree.make_move(0) }.to raise_error
	end
end
