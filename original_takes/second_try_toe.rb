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
          @player.swap_player
        end
    end
  end

  def end_game
    if @board.check_win
      @board.display_board
      @player.swap_player
      winner = @player.show_current_player
      puts "#{winner} wins!"
      true
    elsif @board.check_full
      @board.display_board
      puts "Tie. Game over."
      true
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
    unless @positions.any? { |i| i.is_a?(Integer) }
      true
    end
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

  def initialize
    @player1 = 'X'
    @player2 = 'O'
    @current_player = @player1
  end

  def swap_player
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

tic_tac_toe = Game.new
tic_tac_toe.start_game