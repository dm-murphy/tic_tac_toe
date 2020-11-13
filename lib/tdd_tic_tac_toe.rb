# frozen_string_literal: true

class Game
  attr_accessor :board, :player_1, :player_2, :current_player

  def initialize(board:, player_1:, player_2:)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
    @current_player = @player_1
  end

  def start_game
    until end_game
      @board.display_board
      puts "#{@current_player.name} it's your turn!"
      current_player_pick = @current_player.take_turn
      current_player_position = current_player_pick - 1
      current_marker = @current_player.marker
      swap_player if @board.mark_position(current_player_position, current_marker)
    end
  end

  def end_game
    if @board.check_win
      @board.display_board
      swap_player
      winner = @current_player.name
      puts "#{winner} wins!"
      true
    elsif @board.check_full
      @board.display_board
      puts 'Tie. Game over.'
      true
    end
  end

  def swap_player
    @current_player = if @current_player == @player_1
                        @player_2
                      else
                        @player_1
                      end
  end
end

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

  def update_position(position, marker)
    @positions[position] = marker
  end

  def check_position(position)
    true if @positions[position].is_a? Numeric
  end

  def mark_position(position, marker)
    if check_position(position)
      update_position(position, marker)
      true
    else
      puts 'Not an open position. Try again.'
      false
    end
  end

  def check_full
    @positions.all? { |i| i.is_a?(String) }
  end

  def check_win
    check_winning_combo ? true : false
  end

  def check_winning_combo
    if @positions[0] == 'X' && @positions[1] == 'X' && @positions[2] == 'X' ||
       @positions[3] == 'X' && @positions[4] == 'X' && @positions[5] == 'X' ||
       @positions[6] == 'X' && @positions[7] == 'X' && @positions[8] == 'X' ||
       @positions[0] == 'X' && @positions[3] == 'X' && @positions[6] == 'X' ||
       @positions[1] == 'X' && @positions[4] == 'X' && @positions[7] == 'X' ||
       @positions[2] == 'X' && @positions[5] == 'X' && @positions[8] == 'X' ||
       @positions[0] == 'X' && @positions[4] == 'X' && @positions[8] == 'X' ||
       @positions[2] == 'X' && @positions[4] == 'X' && @positions[6] == 'X' ||
       @positions[0] == 'O' && @positions[1] == 'O' && @positions[2] == 'O' ||
       @positions[3] == 'O' && @positions[4] == 'O' && @positions[5] == 'O' ||
       @positions[6] == 'O' && @positions[7] == 'O' && @positions[8] == 'O' ||
       @positions[0] == 'O' && @positions[3] == 'O' && @positions[6] == 'O' ||
       @positions[1] == 'O' && @positions[4] == 'O' && @positions[7] == 'O' ||
       @positions[2] == 'O' && @positions[5] == 'O' && @positions[8] == 'O' ||
       @positions[0] == 'O' && @positions[4] == 'O' && @positions[8] == 'O' ||
       @positions[2] == 'O' && @positions[4] == 'O' && @positions[6] == 'O'
      true
    end
  end
end

class Player
  attr_reader :name, :marker

  def initialize(marker, name)
    @marker = marker
    # puts "Player #{@marker}, what is your name?"
    # @name = gets.chomp
    @name = name
  end

  def take_turn
    loop do
      puts 'Pick an open number: '
      pick = gets.to_i
      return pick if pick.between?(1, 9)
    end
  end
  
end

#   tic_tac_toe = Game.new(board: Board.new, player_1: Player.new('X', 'Leslie'), player_2: Player.new('O', 'Gary'))

# # #tic_tac_toe = Game.new
#   tic_tac_toe.start_game
