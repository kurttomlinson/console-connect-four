require 'rspec'
require './connect_four_move_tree.rb'

describe 'ConnectFourMoveNode#minimax' do
  it 'returns 1000 for a sure win' do
    tree = ConnectFourMoveTree.new
    tree.make_move(0)
    tree.make_move(1)
    tree.make_move(0)
    tree.make_move(1)
    tree.make_move(0)
    tree.make_move(1)
    tree.last_move.children.each do |child|
      if child.column == 0
        expect(child.minimax(1, true)).to eq 1000
      end
    end
  end
  it 'returns 1000 for a sure loss' do
    tree = ConnectFourMoveTree.new
    tree.make_move(0)
    tree.make_move(1)
    tree.make_move(0)
    tree.make_move(1)
    tree.make_move(0)
    tree.make_move(1)
    tree.make_move(1)
    tree.last_move.children.each do |child|
      if child.column == 1
        expect(child.minimax(1, true)).to eq -1000
      end
    end
  end
  it 'returns 0 for a questionable move' do
    tree = ConnectFourMoveTree.new
    tree.make_move(0)
    tree.last_move.children.each do |child|
      if child.column == 0
        expect(child.minimax(1, true)).to eq 0
      end
    end
  end
end

describe 'ConnectFourMoveNode#minimax' do
  it 'returns the correct number of moves per column' do
    tree = ConnectFourMoveTree.new
    (0..ConnectFourConstants::COLUMNS-1).each do |i|
      [i, 6].min.times do
        tree.make_move(i)
      end
    end
    expect(tree.last_move.moves_per_column).to eq [0, 1, 2, 3, 4, 5, 6]
  end
end
