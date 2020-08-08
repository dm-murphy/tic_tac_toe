# frozen_string_literal: true

# Have another go at the pseudo code and consider objects, classes and methods
# Psuedo Code [Class]

# Create the game [Game]
  # Create the board [Board]
  # Create the players [Player]
# Start the next turn / loop of game [Game]
  # Display the board [Board]
  # Ask input from Player 1 [Player]
  # Check valid input from Player [Player]
  # If invalid ask again for input from Player [Player]
  # If valid change Board position to occupy Player pick [Player]
  # Check for game end
    # If winner or tie, display results and end loop [Game]
    # If no end, switch player turn and repeat [Game]


# Notes

# Hold the board inside a class in a 2D array
# Hardcode the winning combinations


# Rubyish Pseudo Code

# class Game

    # initialize
      # create the board
      # create the players
      # pick first turn

    # next turn
      # start loop
        # call Board display
        # ask first turn player coordinates
        # check for game end
        # switch players
        
    # switch player
      # swap Player 1 for Player 2 or Player 2 for Player 1
      
    # game end
      # check if winner
      # check if tie

    # winner
      # check if Board marks current player winner
      # display results

    # tie
      # check if Board filled
      # display results

# end

# class Board

    # initialize
      # make array of positions
    
    # display
      # update display with positions
      # show display to command line

    # update
      # if position is valid
        # add player value to array
      # if not valid error message

    # valid position
      # check if position is valid
        # if not error
    # (May require multiple methods)

    # 3 consecutive check
      # check for 3 in a row vertically
      # check for 3 in a row horizontally
      # check for 3 in a row diagonally

    # vertical check
      # check if current player value is part of 3 in row

    # horizontal check
      # check if current player value is part of 3 in row
    
    # diagonal check
      # check if current player value is part of 3 in row

    # full board
      # check if every position is filled

# end

# class Player

    # initialize
      # create name variable
      # set player marker "x" or "o"
    
    # get pick
      # loop
        # prompt current player for pick
        # validate pick formatting
        # validate board
        # stop asking
    
    # prompt
      # ask in CL message for coordinate position
      # get player coordinates from CL

    # validate formatting
      # check formatting of coordinates
      # error until proper
    
# end

# New Game
# Next Turn for new game

#########################################

class Game

  def initialize
      @board = Board.new
      
      @player1 = Player.new('X')
      @player2 = Player.new('O')
    
      @current_player = @player1
      @counter = 0
  end

  def start
    loop do
      # call Board display
      @board.display

      # ask first turn player coordinates
      @current_player.get_pick

      # update counter
      @counter += 1
        
      # check for game end
      break if game_end == true

      # switch players
      switch
    end
  end
        
  def switch
    # swap Player 1 for Player 2 or Player 2 for Player 1
    if @current_player = @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end
      
  def game_end
    # check if winner
    # check if tie
    if check_winner == true
      true
    elsif check_tie == true
      true
    else
      false
    end
  end

  def check_winner
    # check if Board marks current player winner
    if @board.consecutive_check == true
      # display results
      puts "#{@current_player} wins the game!"
      true
    else
      false
    end
  end

  def check_tie
    # check if Board filled
    if @board.full == true
      # display results
      puts 'Tie! Well played!'
      true
    else
      false
    end
  end

end

class Board

  def initialize
    # make array of positions
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @grid = {1: 'null', 2: 'null', 3: 'null', 4: 'null', 5: 'null', 6: 'null', 7: 'null', 8: 'null', 9 'null'}
  end

  def update
    # if position is valid
    if @board.valid_position == true
      # add player value to array
      @board.add_value
    else
      # if not valid error message
      puts 'Not a valid move.'
    end
  end

  def display
    # update display with positions
    @board.update
    # show display to command line
    @board.show_display
  end

  def valid_position(player_value)
    true
    # check if position is valid
        # if not error
    # (May require multiple methods)
  end

  def add_value
    # add player value to the board array
    @board.push(@player_value)
  end

  def show_display
    puts @board
  end

  def consecutive_check
    # check for 3 in a row vertically
    @board.vertical_check
    # check for 3 in a row horizontally
    @board.horizontal_check
    # check for 3 in a row diagonally
    @board.diagonal_check
  end

  def vertical_check
    # check if current player value is part of 3 in row
    if @player_value #is part of 3 in a row
      @board.vertical_check == true
    end
  end

  def horizontal_check
    # check if current player value is part of 3 in row
    if @player_value #is part of 3 in a row
      @board.horizontal_check == true
    end
  end

  def diagonal_check
    # check if current player value is part of 3 in row
    if @player_value #is part of 3 in a row
      @board.diagonal_check == true
    end
  end

  def full_board
    # check if every position is filled
    if @counter == 9
      @full_board = true
    else
      @full_board = false
    end
  end

end

class Player

  def initialize(marker)
    # set player marker "x" or "o"
    @player1 = 'X'
    @player2 = 'O'
  end
  
  def get_pick
    loop do
      # prompt current player for pick
      @current_player.prompt
      # validate pick formatting
      @player_value.validate_formatting
      # validate board
      @board.valid_position(@player_value)
      break if valid
    end
  end
    
  def prompt
    # ask in CL message for coordinate position
    puts "#{@current_player} enter a valid position: "
    # get player coordinates from CL
    @player_value = gets.chomp
  end

  def validate_formatting
    # check formatting of coordinates
    # error until proper
  end
    
end

# New Game
tic_tac_toe = Game.new
# Start the game
tic_tac_toe.start