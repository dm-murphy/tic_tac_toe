# Project: Tic Tac Toe

https://www.theodinproject.com/lessons/oop

### Play it Live on Repl.it

https://repl.it/@dmmurphy/RubyProjectTicTacToe#main.rb

### *Problem:*

Write a program where two different users alternate turns selecting positions on a grid. The board must be displayed and updated between turns. Only one user can occupy a position at a time. There are nine positions on the grid. A user wins and ends the game by holding three consequtive positions in a grid direction, horizontal, vertical or diagonal. Otherwise the game ends in a tie when all positions are filled.

### *Original Pseudo Code:*
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
~~~

### *Rubyish Pseudo Code:*
~~~
Game class

  Initialize Game
    Make new instance of board
    Make new instance of player 1
    Make new instance of player 2
    Set current player to player 1

  Start Game
    Start loop
      Until End Game is true
        Display Board for board instance
        Announce current player turn
        Set variable for player instance pick
        Set variable for player instance marker
        Mark Position for board instance with pick and current player variables
        Swap players if valid
  
  End Game
    If board instance Full Check or Win Check
      Return true and declare game outcome
  
  Current Player Swap
    When called, swap player for other player
      
Board class

  Initialize Board
    Board has 9 positions

  Display Board
    Output an arrangement of current grid positions

  Position Update
    Replace array integer value with marker value
  
  Position Check
    Check if poisition is available by seeing if it's a number
  
  Mark
    Use arguments of position pick and marker value
    Call Position Check
    Call Position Update
  
  Full Check
    If all positions have value
      Return true
  
  Win Check
    Check if a Winning Combo exists

  Winning Combo Check
    If a hard-coded winning values exists
      Return true

Player class
  Set name, marker

  Initialize Player
    Assign instance marker to parameter marker
    Ask for player name
    Get name from player and assign to instance name
  
  Take Turn
    Start loop
      Ask current player for their pick
      Validate pick format
      Break loop if valid
      Return pick

Set variable to new instance of Game class
With variable call Start Game method  
~~~




