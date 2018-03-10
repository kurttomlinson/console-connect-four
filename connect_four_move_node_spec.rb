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

describe 'ConnectFourMoveNode#winner' do
  it 'returns nil when there is no winner yet' do
    tree = ConnectFourMoveTree.new
    tree.make_move(1) # 1
    tree.make_move(0)
    tree.make_move(2) # 1
    tree.make_move(3)
    tree.make_move(4) # 1
    tree.make_move(5)
    tree.make_move(6) # 1

    tree.make_move(2)
    tree.make_move(6) # 1
    tree.make_move(3)
    tree.make_move(5) # 1
    tree.make_move(4)

    tree.make_move(5) # 1
    tree.make_move(6)
    tree.make_move(5) # 1
    tree.make_move(6)
    tree.make_move(6) # 1
    tree.make_move(5)
    tree.make_move(5) # 1

    tree.make_move(2)
    tree.make_move(2) # 1
    tree.make_move(4)
    tree.make_move(4) # 1
    tree.make_move(3)
    tree.make_move(4) # 1
    tree.make_move(4)
puts ""
    puts tree.to_s

    expect(tree.last_move.winner).to eq nil
  end
  it 'returns the correct winner (N 1)' do
    tree = ConnectFourMoveTree.new
    tree.make_move(0)
    tree.make_move(1)
    tree.make_move(0)
    tree.make_move(2)
    tree.make_move(0)
    tree.make_move(3)
    tree.make_move(0)
    expect(tree.last_move.winner).to eq ConnectFourConstants::PLAYER_ONE
  end
  it 'returns the correct winner (E 1)' do
    tree = ConnectFourMoveTree.new
    tree.make_move(0) # 1
    tree.make_move(0)
    tree.make_move(1) # 1
    tree.make_move(1)
    tree.make_move(2) # 1
    tree.make_move(2)
    tree.make_move(3) # 1
    expect(tree.last_move.winner).to eq ConnectFourConstants::PLAYER_ONE
  end
  it 'returns the correct winner (N 2)' do
    tree = ConnectFourMoveTree.new
    tree.make_move(6) # 1
    tree.make_move(1)
    tree.make_move(6) # 1
    tree.make_move(2)
    tree.make_move(6) # 1
    tree.make_move(3)
    tree.make_move(6) # 1
    expect(tree.last_move.winner).to eq ConnectFourConstants::PLAYER_ONE
  end
  it 'returns the correct winner (E 2)' do
    tree = ConnectFourMoveTree.new
    tree.make_move(6) # 1
    tree.make_move(6)
    tree.make_move(5) # 1
    tree.make_move(5)
    tree.make_move(4) # 1
    tree.make_move(4)
    tree.make_move(3) # 1
    expect(tree.last_move.winner).to eq ConnectFourConstants::PLAYER_ONE
  end
  it 'returns the correct winner (NE 1)' do
    tree = ConnectFourMoveTree.new
    tree.make_move(0) # 1

    tree.make_move(1)
    tree.make_move(1) # 1

    tree.make_move(6)

    tree.make_move(2) # 1
    tree.make_move(2)
    tree.make_move(2) # 1

    tree.make_move(3)
    tree.make_move(3) # 1
    tree.make_move(3)
    tree.make_move(3) # 1

    expect(tree.last_move.winner).to eq ConnectFourConstants::PLAYER_ONE
  end
  it 'returns the correct winner (SE 1)' do
    tree = ConnectFourMoveTree.new
    tree.make_move(6) # 1

    tree.make_move(3)
    tree.make_move(3) # 1
    tree.make_move(3)
    tree.make_move(3) # 1

    tree.make_move(6)

    tree.make_move(2) # 1
    tree.make_move(2)
    tree.make_move(2) # 1

    tree.make_move(1)
    tree.make_move(1) # 1
    
    tree.make_move(6)

    tree.make_move(0) # 1

    expect(tree.last_move.winner).to eq ConnectFourConstants::PLAYER_ONE
  end
  it 'returns a tie when the board is full' do
    tree = ConnectFourMoveTree.new
    tree.make_move(0) # 1
    tree.make_move(1)
    tree.make_move(0) # 1
    tree.make_move(1)
    tree.make_move(0) # 1
    tree.make_move(1)

    tree.make_move(2) # 1
    tree.make_move(3)
    tree.make_move(2) # 1
    tree.make_move(3)
    tree.make_move(2) # 1
    tree.make_move(3)

    tree.make_move(4) # 1
    tree.make_move(5)
    tree.make_move(4) # 1
    tree.make_move(5)
    tree.make_move(4) # 1
    tree.make_move(5)

    tree.make_move(6) # 1
    tree.make_move(0)
    tree.make_move(6) # 1
    tree.make_move(0)
    tree.make_move(6) # 1
    tree.make_move(0)

    tree.make_move(1) # 1
    tree.make_move(2)
    tree.make_move(1) # 1
    tree.make_move(2)
    tree.make_move(1) # 1
    tree.make_move(2)

    tree.make_move(3) # 1
    tree.make_move(4)
    tree.make_move(3) # 1
    tree.make_move(4)
    tree.make_move(3) # 1
    tree.make_move(4)

    tree.make_move(5) # 1
    tree.make_move(6)
    tree.make_move(5) # 1
    tree.make_move(6)
    tree.make_move(5) # 1
    tree.make_move(6)

    expect(tree.last_move.winner).to eq ConnectFourConstants::TIE
  end
end
