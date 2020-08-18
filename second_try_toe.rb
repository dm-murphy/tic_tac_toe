# Board class pseudo code

  # Make Board
    # Board has 9 positions
    # Position markers start empty

  # Display Board
    # Output an arrangement of current grid positions

  # Position Update
    # Replace empty value with marker value
  
  # Position Check
    # Check if poisition is available/empty
  
  # Mark
    # Use placeholder/input value and marker value
    # Set current marker value
    # Call Position Check
    # Call Position Update
  
  # Full Check
    # If all positions have value
      # Return true
  
  # Win Check
    # If a hard-coded winning value exists
      # Return marker value

############################################################

class Board

  def initialize
    # Board has 9 positions
    # Position markers start empty
    @positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @winner = ''
  end

  def display_board
    # Output an arrangement of current grid positions
    puts <<-HEREDOC
    #{@positions[0]} | #{@positions[1]} | #{@positions[2]}
    --|---|--
    #{@positions[3]} | #{@positions[4]} | #{@positions[5]}
    --|---|--
    #{@positions[6]} | #{@positions[7]} | #{@positions[8]}

    HEREDOC
  end

  def position_update(position, marker)
    # Replace array value with marker value
    @positions[position] = marker
  end
  
  def position_check(position)
    # Check if position is available by seeing if number or marker
    if @positions[position].is_a? Numeric
      puts "Yup it's true!"
      true
    end
    
  end
  
  def mark_position(position, marker)
    # Set current marker value
    # Call Position Check
    if position_check(position)
      # Call Position Update
      position_update(position, marker)
    else
      puts 'Not valid position'
    end
  end
  
  def full_check
    # If all positions have value
    unless @positions.any? { |i| i.is_a?(Integer) }
      puts 'The board is full'
      # Return true
      true
    end
  end
      
  
  def win_check
    # If a hard-coded winning value exists
      # Return marker value
    if @positions[0] == 'X' && @positions[1] == 'X' && @positions[2] == 'X'
      puts 'X actually won!'
      @winner = 'X'
    elsif @positions[0] == 'O' && @positions[1] == 'O' && @positions[2] == 'O'
      puts 'O won the game!'
      @winner = 'O'
    elsif @positions[3] == 'X' && @positions[4] == 'X' && @positions[5] == 'X'
      puts 'X actually won!'
      @winner = 'X'
    elsif @positions[3] == 'O' && @positions[4] == 'O' && @positions[5] == 'O'
      puts 'O won the game!'
      @winner = 'O'
    elsif @positions[6] == 'X' && @positions[7] == 'X' && @positions[8] == 'X'
      puts 'X actually won!'
      @winner = 'X'
    elsif @positions[6] == 'O' && @positions[7] == 'O' && @positions[8] == 'O'
      puts 'O won the game!'
      @winner = 'O'
    elsif @positions[0] == 'X' && @positions[3] == 'X' && @positions[6] == 'X'
      puts 'X actually won!'
      @winner = 'X'
    elsif @positions[0] == 'O' && @positions[3] == 'O' && @positions[6] == 'O'
      puts 'O won the game!'
      @winner = 'O'
    elsif @positions[1] == 'X' && @positions[4] == 'X' && @positions[7] == 'X'
      puts 'X actually won!'
      @winner = 'X'
    elsif @positions[1] == 'O' && @positions[4] == 'O' && @positions[7] == 'O'
      puts 'O won the game!'
      @winner = 'O'
    elsif @positions[2] == 'X' && @positions[5] == 'X' && @positions[8] == 'X'
      puts 'X actually won!'
      @winner = 'X'
    elsif @positions[2] == 'O' && @positions[5] == 'O' && @positions[8] == 'O'
      puts 'O won the game!'
      @winner = 'O'
    elsif @positions[0] == 'X' && @positions[4] == 'X' && @positions[8] == 'X'
      puts 'X actually won!'
      @winner = 'X'
    elsif @positions[0] == 'O' && @positions[4] == 'O' && @positions[8] == 'O'
      puts 'O won the game!'
      @winner = 'O'
    elsif @positions[2] == 'X' && @positions[4] == 'X' && @positions[6] == 'X'
      puts 'X actually won!'
      @winner = 'X'
    elsif @positions[2] == 'O' && @positions[4] == 'O' && @positions[6] == 'O'
      puts 'O won the game!'
      @winner = 'O'
    end
  end

end

############################

# Pesudo Code for Player Class

# Player

  # Initialize Player
    # Set 2 player variables
    # Get names and assign to the player variables
    # Assign markers to players
    # Puts player their own marker
  
  # Current Player Swap
    # Default to player 1 (Maybe goes in initialize?)
    # When called, swap player for other player
  
  # Get pick
    # Start loop
      # Ask current player for their pick (display updated board first?)
      # Validate pick format
      # Call Board class for mark method
      # End loop if position available
    # Call Current Player Swap
  
    
############################

class Player
  #Players plural?

  def initialize
    @player1 = 'X'
    @player2 = 'O'
    # Assign markers to players
    # Puts player their own marker
    # Default current player to player 1
    @current_player = @player1
    #@pick = ''
  end 
  
  def player_swap
    # When called, swap player for other player
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end    
  end
  
  def get_current_player_pick
    # Start pick number loop
    loop do
    # Ask current player for their pick (display updated board first?)
      puts "#{@current_player} pick an open number: "
      @pick = gets.chomp.to_i
      # Validate pick format
      if @pick.between?(1,9)
        puts 'Valid format, checking for availability...'
        # Break pick number loop
        break
      end
    end
    @pick
  end

  def show_current_player
    @current_player
  end

end
   #def call_board_check

    #  if @board.position_check(@pick)
     #   break
      #end
    # End loop if position available
   # end
    # Call Current Player Swap
    #player_swap
 # end

class Game
  def initialize
    @board = Board.new
    @player = Player.new
  end

  def start_game
    #loop do
      until end_game
        @board.display_board  
        current_player_pick = @player.get_current_player_pick
        current_player_position = current_player_pick - 1
        puts current_player_pick
        current_player = @player.show_current_player 
        @board.mark_position(current_player_position, current_player)
        @player.player_swap
      end
    #end
  end

  def end_game
    if @board.full_check || @board.win_check
      true
    end
  end

end

  tic_tac_toe = Game.new
  tic_tac_toe.start_game
  

  #tic_tac_toe = Board.new

  #tic_tac_toe.display_board
  
  #tic_tac_toe.mark_position(4, 'X')
  
  #tic_tac_toe.display_board
  
  #tic_tac_toe.full_check
  
  #tic_tac_toe.mark_position(0, 'X')
  #tic_tac_toe.mark_position(1, 'X')
  #tic_tac_toe.mark_position(2, 'X')
  #tic_tac_toe.mark_position(3, 'X')
  #tic_tac_toe.mark_position(5, 'X')
  #tic_tac_toe.mark_position(6, 'X')
  #tic_tac_toe.mark_position(7, 'X')
  #tic_tac_toe.full_check
  #tic_tac_toe.mark_position(8, 'X')
  
  #tic_tac_toe.display_board
  #tic_tac_toe.full_check
  #tic_tac_toe.win_check


#test = Player.new
#test.get_current_player_pick
#test.player_swap
#test.get_current_player_pick

# How do I use one of the Board class methods from within the Player class method?

#You have to start your loop. So you'll need something that gets that going from the CL. That
# would essentially start the Game. Then the game could initialize the Players. Then the Players would
# know the data of the player names and markers. 

# a Player has-a Pick



### So running game, board and players. Loop starts and can get pick and can check and mark pick.
### Situation: I want my game start loop to swap player turns back and forth. It's stuck doing
### Player 1, Player 2, Player 2, Player 2, etc.