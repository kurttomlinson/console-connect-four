require 'rspec'
require './connect_four_move_tree.rb'

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
