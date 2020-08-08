Project: Tic Tac Toe

(https://www.theodinproject.com/lessons/oop)

*Problem:*

Write a program where two different users alternate turns selecting positions on a grid. The board must be displayed and updated between turns. Only one user can occupy a position at a time. There are nine positions on the grid. A user wins and ends the game by holding three consequtive positions in a grid direction, horizontal, vertical or diagonal. Otherwise the game ends in a tie when all positions are filled.

*Pseudo Code:*
~~~
Command line asks for Player 1 pick
Player 1 pick is checked for availability on board
If not open
  Command line asks for Player 1 pick
If open
  Board position variable equals Player 1 "X"
  Board position state changes to occupied
Computer checks for winner, tie or next turn
Updated board is displayed
Command line asks for Player 2 pick
Player 2 pick is checked for availability on board
If not open
  Command line asks for Player 2 pick
If open
  Board position variable equals Player 2 "O"
  Board position state changes to occupied
Computer checks for winner, tie or next turn
Updated board is displayed
Repeat steps until checks find winner or tie

Checks: (Each check could be seperate method)
If 3 consecutive found
  Player wins
Else If all positions == occupied
  Tie
Else
  Check for next turn



Position 1
Position 2
Position 3
Position 4
Position 5
Position 6
Position 7
Position 8
Position 9

if user enters number 1 -9
  Position.new(3)

Some talking about multiple .rb files, one for main, one for Players, one for board
