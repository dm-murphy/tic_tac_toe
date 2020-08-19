Project: Tic Tac Toe

(https://www.theodinproject.com/lessons/oop)

*Problem:*

Write a program where two different users alternate turns selecting positions on a grid. The board must be displayed and updated between turns. Only one user can occupy a position at a time. There are nine positions on the grid. A user wins and ends the game by holding three consequtive positions in a grid direction, horizontal, vertical or diagonal. Otherwise the game ends in a tie when all positions are filled.

*Original Pseudo Code:*
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

*Rubyish Pseudo Code*
~~~
Game class

  Initialize Game
    Make new instance of board
    Make new instance of player

  Start Game
    Start loop
      Until End Game is true
        Display Board for board instance
        Set variable for player instance pick
        Set variable for player instance current player
        Mark Position for board instance with pick and current player variables
        Current Player Swap for player instance
  
  End Game
    If board instance Full Check of Win Check
      Return true
      
Board class

  Initialize Board
    Board has 9 positions
    Position markers start empty

  Display Board
    Output an arrangement of current grid positions

  Position Update
    Replace array value with marker value
  
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
    If a hard-coded winning value exists
      Return marker value

Player class

  Initialize Player
    Assign markers to players
    Default current player to player 1
  
  Current Player Swap
    When called, swap player for other player
    
  Get Pick
    Start loop
      Ask current player for their pick
      Validate pick format
      Break loop if valid
  
  Show Current Player
    Return current player when called

Set variable to new instance of Game class
With variable call Start Game method  
~~~




