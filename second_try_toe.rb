class Board

  def initialize
    @positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def display_board
    puts <<-HEREDOC

    #{@positions[0]} | #{@positions[1]} | #{@positions[2]}
    --|---|--
    #{@positions[3]} | #{@positions[4]} | #{@positions[5]}
    --|---|--
    #{@positions[6]} | #{@positions[7]} | #{@positions[8]}

    HEREDOC
  end

  def position_update(position, marker)
    @positions[position] = marker
  end

  def position_check(position)
    true if @positions[position].is_a? Numeric
  end

  def mark_position(position, marker)
    if position_check(position)
      position_update(position, marker)
      true
    else
      puts 'Not valid position. Try again.'
      false
    end
  end

  def full_check
    unless @positions.any? { |i| i.is_a?(Integer) }
      puts 'The board is full.'
      true
    end
  end

  def win_check
    winning_combo_check ? true : false
  end

  def winning_combo_check
    if @positions[0] == 'X' && @positions[1] == 'X' && @positions[2] == 'X' ||
       @positions[3] == 'X' && @positions[4] == 'X' && @positions[5] == 'X' ||
       @positions[6] == 'X' && @positions[7] == 'X' && @positions[8] == 'X' ||
       @positions[0] == 'X' && @positions[3] == 'X' && @positions[6] == 'X' ||       
       @positions[1] == 'X' && @positions[4] == 'X' && @positions[7] == 'X' ||
       @positions[2] == 'X' && @positions[5] == 'X' && @positions[8] == 'X' ||
       @positions[0] == 'X' && @positions[4] == 'X' && @positions[8] == 'X' ||
       @positions[2] == 'X' && @positions[4] == 'X' && @positions[6] == 'X' 
       puts 'X wins.'
       true
    elsif @positions[0] == 'O' && @positions[1] == 'O' && @positions[2] == 'O' ||
          @positions[3] == 'O' && @positions[4] == 'O' && @positions[5] == 'O' ||
          @positions[6] == 'O' && @positions[7] == 'O' && @positions[8] == 'O' ||
          @positions[0] == 'O' && @positions[3] == 'O' && @positions[6] == 'O' ||
          @positions[1] == 'O' && @positions[4] == 'O' && @positions[7] == 'O' ||
          @positions[2] == 'O' && @positions[5] == 'O' && @positions[8] == 'O' ||
          @positions[0] == 'O' && @positions[4] == 'O' && @positions[8] == 'O' ||
          @positions[2] == 'O' && @positions[4] == 'O' && @positions[6] == 'O'
          puts 'O wins.'
          true
    end
  end
end

class Player

  def initialize
    @player1 = 'X'
    @player2 = 'O'
    @current_player = @player1
  end

  def player_swap
    @current_player = if @current_player == @player1
                        @player2
                      else
                        @player1
                      end
  end

  def get_current_player_pick
    loop do
      puts "#{@current_player} pick an open number: "
      @pick = gets.chomp.to_i
      if @pick.between?(1,9)
        break
      end
    end
    @pick
  end

  def show_current_player
    @current_player
  end
end

class Game
  def initialize
    @board = Board.new
    @player = Player.new
  end

  def start_game
    until end_game
      @board.display_board
      current_player_pick = @player.get_current_player_pick
      current_player_position = current_player_pick - 1
      current_player = @player.show_current_player 
        if @board.mark_position(current_player_position, current_player)
          @player.player_swap
        end
    end
  end

  def end_game
    if @board.win_check
      @board.display_board
      winner = @player.show_current_player
      puts "#{winner} wins. Pizza pizza."
      true
    elsif @board.full_check
      @board.display_board
      puts "Tie. Game over."
      true
    end
  end
end

tic_tac_toe = Game.new
tic_tac_toe.start_game

# How to announce winner from Game class, not Board class
# Fix player swap screw up in announcing winner