require './connect_four_move_node.rb'
require './connect_four_constants.rb'

class ConnectFourMoveTree
  attr_accessor :root
  attr_accessor :last_move
  attr_accessor :player_to_move

  def initialize
    @player_to_move = ConnectFourConstants::PLAYER_ONE
  end

  def make_move(column)
    if (column < 0) || (column >= ConnectFourConstants::COLUMNS)
      raise "columns must be between 0 and #{ConnectFourConstants::COLUMNS - 1}"
    end
    if @last_move.nil?
      @root = ConnectFourMoveNode.new(nil, column)
      @last_move = @root
    else
      if @last_move.moves_per_column[column] >= ConnectFourConstants::ROWS
        raise "column overflow"
      end
      @last_move.children.each do |child|
        if child.column == column
          @last_move = child
          break
        end
      end
    end
    @last_move.owner = @player_to_move
    @player_to_move = (@player_to_move == ConnectFourConstants::PLAYER_ONE) ? ConnectFourConstants::PLAYER_TWO : ConnectFourConstants::PLAYER_ONE
  end

  def to_s
    string = ""
    (ConnectFourConstants::ROWS-1).step(0, -1) do |row|
      (0..ConnectFourConstants::COLUMNS-1).each do |column|
        if @last_move.board_state[column][row].nil?
          string += " ."
        else
          string += " " + @last_move.board_state[column][row]
        end
      end
      string += "\n"
    end
    return string
  end

  def winner
    @last_move&.winner
  end
end
