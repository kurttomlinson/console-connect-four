# console-connect-four
A console version of Connect Four written in Ruby.

# How to play
Run `ruby ./connect_four.rb`.

Enter a number between 0 and 6 to choose which column to play in. To let the computer make the next move, enter `c`. The computer searches the game tree with the Minimax algorithm to a default depth of 4 plies. To change this, enter `cx` where `x` is a digit from 1 to 9 that indicates how many plies deep the AI should search. For example, `c6` will make the computer make the next move with a search depth of 6.

# How to test
Run `rspec ./connect_four_move_node_spec.rb` and `rspec ./connect_four_move_tree_spec.rb`.

# Example game
See below for an example of what a game looks like in the console with two computer players. The column scores in the printout show the Minimax scores for each potential move. 1000 == guaranteed win. -1000 == guaranteed loss. 0 == tie or unknown outcome.

```
 . . . . . . .
 . . . . . . .
 . . . . . . .
 . . . . . . .
 . . . . . . .
 . . . . . . .
---------------
 0 1 2 3 4 5 6

move? (0 through 6 or nothing for computer)

ai move: 5

 . . . . . . .
 . . . . . . .
 . . . . . . .
 . . . . . . .
 . . . . . . .
 . . . . . 1 .
---------------
 0 1 2 3 4 5 6

Minimax algorithm results for player 2 with depth 4:
        Column 0 score: 0
        Column 1 score: 0
        Column 2 score: 0
        Column 3 score: 0
        Column 4 score: 0
        Column 5 score: 0
        Column 6 score: 0

move? (0 through 6 or nothing for computer)

ai move: 2

 . . . . . . .
 . . . . . . .
 . . . . . . .
 . . . . . . .
 . . . . . . .
 . . 2 . . 1 .
---------------
 0 1 2 3 4 5 6

Minimax algorithm results for player 1 with depth 4:
        Column 0 score: 0
        Column 1 score: 0
        Column 2 score: 0
        Column 3 score: 0
        Column 4 score: 0
        Column 5 score: 0
        Column 6 score: 0

move? (0 through 6 or nothing for computer)

ai move: 4

 . . . . . . .
 . . . . . . .
 . . . . . . .
 . . . . . . .
 . . . . . . .
 . . 2 . 1 1 .
---------------
 0 1 2 3 4 5 6

Minimax algorithm results for player 2 with depth 4:
        Column 0 score: 0
        Column 1 score: 0
        Column 2 score: 0
        Column 3 score: 0
        Column 4 score: 0
        Column 5 score: 0
        Column 6 score: 0

move? (0 through 6 or nothing for computer)

ai move: 4

 . . . . . . .
 . . . . . . .
 . . . . . . .
 . . . . . . .
 . . . . 2 . .
 . . 2 . 1 1 .
---------------
 0 1 2 3 4 5 6

Minimax algorithm results for player 1 with depth 4:
        Column 0 score: 0
        Column 1 score: 0
        Column 2 score: 0
        Column 3 score: 0
        Column 4 score: 0
        Column 5 score: 0
        Column 6 score: 0

move? (0 through 6 or nothing for computer)

ai move: 0

 . . . . . . .
 . . . . . . .
 . . . . . . .
 . . . . . . .
 . . . . 2 . .
 1 . 2 . 1 1 .
---------------
 0 1 2 3 4 5 6

Minimax algorithm results for player 2 with depth 4:
        Column 0 score: 0
        Column 1 score: 0
        Column 2 score: 0
        Column 3 score: 0
        Column 4 score: 0
        Column 5 score: 0
        Column 6 score: 0

move? (0 through 6 or nothing for computer)

ai move: 5

 . . . . . . .
 . . . . . . .
 . . . . . . .
 . . . . . . .
 . . . . 2 2 .
 1 . 2 . 1 1 .
---------------
 0 1 2 3 4 5 6

Minimax algorithm results for player 1 with depth 4:
        Column 0 score: 0
        Column 1 score: 0
        Column 2 score: 0
        Column 3 score: 0
        Column 4 score: 0
        Column 5 score: 0
        Column 6 score: 0

move? (0 through 6 or nothing for computer)

ai move: 2

 . . . . . . .
 . . . . . . .
 . . . . . . .
 . . . . . . .
 . . 1 . 2 2 .
 1 . 2 . 1 1 .
---------------
 0 1 2 3 4 5 6

Minimax algorithm results for player 2 with depth 4:
        Column 0 score: 0
        Column 1 score: 0
        Column 2 score: 0
        Column 3 score: 0
        Column 4 score: 0
        Column 5 score: 0
        Column 6 score: 0

move? (0 through 6 or nothing for computer)

ai move: 0

 . . . . . . .
 . . . . . . .
 . . . . . . .
 . . . . . . .
 2 . 1 . 2 2 .
 1 . 2 . 1 1 .
---------------
 0 1 2 3 4 5 6

Minimax algorithm results for player 1 with depth 4:
        Column 0 score: 0
        Column 1 score: 0
        Column 2 score: 0
        Column 3 score: 0
        Column 4 score: 0
        Column 5 score: 0
        Column 6 score: 0

move? (0 through 6 or nothing for computer)

ai move: 2

 . . . . . . .
 . . . . . . .
 . . . . . . .
 . . 1 . . . .
 2 . 1 . 2 2 .
 1 . 2 . 1 1 .
---------------
 0 1 2 3 4 5 6

Minimax algorithm results for player 2 with depth 4:
        Column 0 score: 0
        Column 1 score: 0
        Column 2 score: 0
        Column 3 score: 0
        Column 4 score: 0
        Column 5 score: 0
        Column 6 score: 0

move? (0 through 6 or nothing for computer)

ai move: 6

 . . . . . . .
 . . . . . . .
 . . . . . . .
 . . 1 . . . .
 2 . 1 . 2 2 .
 1 . 2 . 1 1 2
---------------
 0 1 2 3 4 5 6

Minimax algorithm results for player 1 with depth 4:
        Column 0 score: 0
        Column 1 score: 0
        Column 2 score: 0
        Column 3 score: 0
        Column 4 score: 0
        Column 5 score: 0
        Column 6 score: 0

move? (0 through 6 or nothing for computer)

ai move: 0

 . . . . . . .
 . . . . . . .
 . . . . . . .
 1 . 1 . . . .
 2 . 1 . 2 2 .
 1 . 2 . 1 1 2
---------------
 0 1 2 3 4 5 6

Minimax algorithm results for player 2 with depth 4:
        Column 0 score: 0
        Column 1 score: 0
        Column 2 score: 0
        Column 3 score: 0
        Column 4 score: 0
        Column 5 score: 0
        Column 6 score: 0

move? (0 through 6 or nothing for computer)

ai move: 0

 . . . . . . .
 . . . . . . .
 2 . . . . . .
 1 . 1 . . . .
 2 . 1 . 2 2 .
 1 . 2 . 1 1 2
---------------
 0 1 2 3 4 5 6

Minimax algorithm results for player 1 with depth 4:
        Column 0 score: 0
        Column 1 score: 0
        Column 2 score: 0
        Column 3 score: 0
        Column 4 score: 0
        Column 5 score: 0
        Column 6 score: 0

move? (0 through 6 or nothing for computer)

ai move: 5

 . . . . . . .
 . . . . . . .
 2 . . . . . .
 1 . 1 . . 1 .
 2 . 1 . 2 2 .
 1 . 2 . 1 1 2
---------------
 0 1 2 3 4 5 6

Minimax algorithm results for player 2 with depth 4:
        Column 0 score: 0
        Column 1 score: 0
        Column 2 score: 0
        Column 3 score: 0
        Column 4 score: 0
        Column 5 score: 0
        Column 6 score: 0

move? (0 through 6 or nothing for computer)

ai move: 5

 . . . . . . .
 . . . . . . .
 2 . . . . 2 .
 1 . 1 . . 1 .
 2 . 1 . 2 2 .
 1 . 2 . 1 1 2
---------------
 0 1 2 3 4 5 6

Minimax algorithm results for player 1 with depth 4:
        Column 0 score: 0
        Column 1 score: 0
        Column 2 score: 0
        Column 3 score: -1000
        Column 4 score: 0
        Column 5 score: 0
        Column 6 score: 0

move? (0 through 6 or nothing for computer)

ai move: 2

 . . . . . . .
 . . . . . . .
 2 . 1 . . 2 .
 1 . 1 . . 1 .
 2 . 1 . 2 2 .
 1 . 2 . 1 1 2
---------------
 0 1 2 3 4 5 6

Minimax algorithm results for player 2 with depth 4:
        Column 0 score: -1000
        Column 1 score: -1000
        Column 2 score: 0
        Column 3 score: -1000
        Column 4 score: -1000
        Column 5 score: -1000
        Column 6 score: -1000

move? (0 through 6 or nothing for computer)

ai move: 2

 . . . . . . .
 . . 2 . . . .
 2 . 1 . . 2 .
 1 . 1 . . 1 .
 2 . 1 . 2 2 .
 1 . 2 . 1 1 2
---------------
 0 1 2 3 4 5 6

Minimax algorithm results for player 1 with depth 4:
        Column 0 score: 0
        Column 1 score: 0
        Column 2 score: 0
        Column 3 score: -1000
        Column 4 score: 0
        Column 5 score: 0
        Column 6 score: 0

move? (0 through 6 or nothing for computer)

ai move: 0

 . . . . . . .
 1 . 2 . . . .
 2 . 1 . . 2 .
 1 . 1 . . 1 .
 2 . 1 . 2 2 .
 1 . 2 . 1 1 2
---------------
 0 1 2 3 4 5 6

Minimax algorithm results for player 2 with depth 4:
        Column 0 score: 0
        Column 1 score: 0
        Column 2 score: 0
        Column 3 score: 0
        Column 4 score: 0
        Column 5 score: 0
        Column 6 score: 0

move? (0 through 6 or nothing for computer)

ai move: 1

 . . . . . . .
 1 . 2 . . . .
 2 . 1 . . 2 .
 1 . 1 . . 1 .
 2 . 1 . 2 2 .
 1 2 2 . 1 1 2
---------------
 0 1 2 3 4 5 6

Minimax algorithm results for player 1 with depth 4:
        Column 0 score: 0
        Column 1 score: 0
        Column 2 score: 0
        Column 3 score: -1000
        Column 4 score: 0
        Column 5 score: 0
        Column 6 score: 0

move? (0 through 6 or nothing for computer)

ai move: 1

 . . . . . . .
 1 . 2 . . . .
 2 . 1 . . 2 .
 1 . 1 . . 1 .
 2 1 1 . 2 2 .
 1 2 2 . 1 1 2
---------------
 0 1 2 3 4 5 6

Minimax algorithm results for player 2 with depth 4:
        Column 0 score: 0
        Column 1 score: 0
        Column 2 score: 0
        Column 3 score: 0
        Column 4 score: 0
        Column 5 score: 0
        Column 6 score: 0

move? (0 through 6 or nothing for computer)

ai move: 6

 . . . . . . .
 1 . 2 . . . .
 2 . 1 . . 2 .
 1 . 1 . . 1 .
 2 1 1 . 2 2 2
 1 2 2 . 1 1 2
---------------
 0 1 2 3 4 5 6

Minimax algorithm results for player 1 with depth 4:
        Column 0 score: 0
        Column 1 score: 0
        Column 2 score: 0
        Column 3 score: -1000
        Column 4 score: 0
        Column 5 score: 0
        Column 6 score: 0

move? (0 through 6 or nothing for computer)

ai move: 6

 . . . . . . .
 1 . 2 . . . .
 2 . 1 . . 2 .
 1 . 1 . . 1 1
 2 1 1 . 2 2 2
 1 2 2 . 1 1 2
---------------
 0 1 2 3 4 5 6

Minimax algorithm results for player 2 with depth 4:
        Column 0 score: 0
        Column 1 score: 0
        Column 2 score: 0
        Column 3 score: 0
        Column 4 score: 0
        Column 5 score: 0
        Column 6 score: 0

move? (0 through 6 or nothing for computer)

ai move: 4

 . . . . . . .
 1 . 2 . . . .
 2 . 1 . . 2 .
 1 . 1 . 2 1 1
 2 1 1 . 2 2 2
 1 2 2 . 1 1 2
---------------
 0 1 2 3 4 5 6

Minimax algorithm results for player 1 with depth 4:
        Column 0 score: 0
        Column 1 score: 0
        Column 2 score: 0
        Column 3 score: -1000
        Column 4 score: 0
        Column 5 score: 0
        Column 6 score: 0

move? (0 through 6 or nothing for computer)

ai move: 5

 . . . . . . .
 1 . 2 . . 1 .
 2 . 1 . . 2 .
 1 . 1 . 2 1 1
 2 1 1 . 2 2 2
 1 2 2 . 1 1 2
---------------
 0 1 2 3 4 5 6

Minimax algorithm results for player 2 with depth 4:
        Column 0 score: 0
        Column 1 score: 0
        Column 2 score: 0
        Column 3 score: 0
        Column 4 score: 0
        Column 5 score: 0
        Column 6 score: 0

move? (0 through 6 or nothing for computer)

ai move: 3

 . . . . . . .
 1 . 2 . . 1 .
 2 . 1 . . 2 .
 1 . 1 . 2 1 1
 2 1 1 . 2 2 2
 1 2 2 2 1 1 2
---------------
 0 1 2 3 4 5 6

Minimax algorithm results for player 1 with depth 4:
        Column 0 score: -1000
        Column 1 score: -1000
        Column 2 score: -1000
        Column 3 score: 0
        Column 4 score: -1000
        Column 5 score: -1000
        Column 6 score: -1000

move? (0 through 6 or nothing for computer)

ai move: 3

 . . . . . . .
 1 . 2 . . 1 .
 2 . 1 . . 2 .
 1 . 1 . 2 1 1
 2 1 1 1 2 2 2
 1 2 2 2 1 1 2
---------------
 0 1 2 3 4 5 6

Minimax algorithm results for player 2 with depth 4:
        Column 0 score: -1000
        Column 1 score: -1000
        Column 2 score: -1000
        Column 3 score: -1000
        Column 4 score: 0
        Column 5 score: -1000
        Column 6 score: -1000

move? (0 through 6 or nothing for computer)

ai move: 4

 . . . . . . .
 1 . 2 . . 1 .
 2 . 1 . 2 2 .
 1 . 1 . 2 1 1
 2 1 1 1 2 2 2
 1 2 2 2 1 1 2
---------------
 0 1 2 3 4 5 6

Minimax algorithm results for player 1 with depth 4:
        Column 0 score: -1000
        Column 1 score: -1000
        Column 2 score: -1000
        Column 3 score: -1000
        Column 4 score: 1000
        Column 5 score: -1000
        Column 6 score: -1000

move? (0 through 6 or nothing for computer)

ai move: 4

 . . . . . . .
 1 . 2 . 1 1 .
 2 . 1 . 2 2 .
 1 . 1 . 2 1 1
 2 1 1 1 2 2 2
 1 2 2 2 1 1 2
---------------
 0 1 2 3 4 5 6

Minimax algorithm results for player 2 with depth 4:
        Column 0 score: -1000
        Column 1 score: -1000
        Column 2 score: -1000
        Column 3 score: -1000
        Column 4 score: -1000
        Column 5 score: -1000
        Column 6 score: -1000

move? (0 through 6 or nothing for computer)

ai move: 5

 . . . . . 2 .
 1 . 2 . 1 1 .
 2 . 1 . 2 2 .
 1 . 1 . 2 1 1
 2 1 1 1 2 2 2
 1 2 2 2 1 1 2
---------------
 0 1 2 3 4 5 6

Minimax algorithm results for player 1 with depth 4:
        Column 0 score: 1000
        Column 1 score: 1000
        Column 2 score: 1000
        Column 3 score: -1000
        Column 4 score: 1000
        Column 6 score: 1000

move? (0 through 6 or nothing for computer)

ai move: 6

 . . . . . 2 .
 1 . 2 . 1 1 .
 2 . 1 . 2 2 1
 1 . 1 . 2 1 1
 2 1 1 1 2 2 2
 1 2 2 2 1 1 2
---------------
 0 1 2 3 4 5 6

Minimax algorithm results for player 2 with depth 4:
        Column 0 score: -1000
        Column 1 score: -1000
        Column 2 score: -1000
        Column 3 score: -1000
        Column 4 score: -1000
        Column 6 score: -1000

move? (0 through 6 or nothing for computer)

ai move: 4

 . . . . 2 2 .
 1 . 2 . 1 1 .
 2 . 1 . 2 2 1
 1 . 1 . 2 1 1
 2 1 1 1 2 2 2
 1 2 2 2 1 1 2
---------------
 0 1 2 3 4 5 6

Minimax algorithm results for player 1 with depth 4:
        Column 0 score: 1000
        Column 1 score: 1000
        Column 2 score: 1000
        Column 3 score: -1000
        Column 6 score: 1000

move? (0 through 6 or nothing for computer)

ai move: 1

 . . . . 2 2 .
 1 . 2 . 1 1 .
 2 . 1 . 2 2 1
 1 1 1 . 2 1 1
 2 1 1 1 2 2 2
 1 2 2 2 1 1 2
---------------
 0 1 2 3 4 5 6

Minimax algorithm results for player 2 with depth 4:
        Column 0 score: -1000
        Column 1 score: -1000
        Column 2 score: -1000
        Column 3 score: -1000
        Column 6 score: -1000

move? (0 through 6 or nothing for computer)

ai move: 0

 2 . . . 2 2 .
 1 . 2 . 1 1 .
 2 . 1 . 2 2 1
 1 1 1 . 2 1 1
 2 1 1 1 2 2 2
 1 2 2 2 1 1 2
---------------
 0 1 2 3 4 5 6

Minimax algorithm results for player 1 with depth 4:
        Column 1 score: 1000
        Column 2 score: 1000
        Column 3 score: 1000
        Column 6 score: 1000

move? (0 through 6 or nothing for computer)

ai move: 1

 2 . . . 2 2 .
 1 . 2 . 1 1 .
 2 1 1 . 2 2 1
 1 1 1 . 2 1 1
 2 1 1 1 2 2 2
 1 2 2 2 1 1 2
---------------
 0 1 2 3 4 5 6
Winner: 1
```