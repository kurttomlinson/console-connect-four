# console-connect-four
A console version of Connect Four written in Ruby.

# How to play
Run `ruby ./connect_four.rb`. Enter a number between 0 and 6 to choose which column to play in. To let the computer make the next move, enter `c`. By default the computer searches the game tree with the Minimax algorithm to a depth of 4 plies. To change this, enter `cx` where `x` is a digit from 1 to 9 that indicates how many plies deep the AI should search. For example, `c6` will make the computer make the next move with a search depth of 6.

# How to test
Run `rspec ./connect_four_move_node_spec.rb` and `rspec ./connect_four_move_tree_spec.rb`.

# Example game
This is what a game looks like in the console: