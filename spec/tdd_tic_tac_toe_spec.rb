# frozen_string_literal: true

#spec/tdd_tic_tac_toe_spec.rb
require './lib/tdd_tic_tac_toe'

describe Game do
  describe '#end_game' do
    it 'returns true when a player has won' do
      game = Game.new(board: Board.new, player_1: Player.new('X', 'Leslie'), player_2: Player.new('O', 'Gary'))
      allow(game.board).to receive(:check_win).and_return(true)

      expect(game.end_game).to be true
    end
  end

  describe '#end_game' do
    it 'returns nil when there is no winner and board is not full' do
      game = Game.new(board: Board.new, player_1: Player.new('X', 'Leslie'), player_2: Player.new('O', 'Gary'))
      allow(game.board).to receive(:check_win).and_return(false)
      allow(game.board).to receive(:check_full).and_return(false)
 
      expect(game.end_game).to be nil
    end
  end

  describe '#end_game' do
    it 'returns true when the game is tied' do
      game = Game.new(board: Board.new, player_1: Player.new('X', 'Leslie'), player_2: Player.new('O', 'Gary'))
      allow(game.board).to receive(:check_full).and_return(true)

      expect(game.end_game).to be true
    end
  end

  describe '#swap_player' do
    context 'when @current_player is @player_1' do
      it 'changes @current_player to @player_2' do
        game = Game.new(board: Board.new, player_1: Player.new('X', 'Leslie'), player_2: Player.new('O', 'Gary'))
        player_1 = game.instance_variable_get(:@player_1)
        player_2 = game.instance_variable_get(:@player_2)
        game.instance_variable_set(:@current_player, player_1)
        
        expect { game.swap_player }.to change { game.instance_variable_get(:@current_player) }.from(player_1).to(player_2)
      end
    end

    context 'when @current_player is @player_2' do
      it 'changes @current_player to @player_1' do
        game = Game.new(board: Board.new, player_1: Player.new('X', 'Leslie'), player_2: Player.new('O', 'Gary'))
        player_1 = game.instance_variable_get(:@player_1)
        player_2 = game.instance_variable_get(:@player_2)
        game.instance_variable_set(:@current_player, player_2)

        expect { game.swap_player }.to change { game.instance_variable_get(:@current_player) }.from(player_2).to(player_1)
      end
    end

    context 'when using getter methods on the object and @current_player is @player_1' do
      it 'changes @current_player to @player_1' do
        game = Game.new(board: Board.new, player_1: Player.new('X', 'Leslie'), player_2: Player.new('O', 'Gary'))
        player_1 = game.player_1
        player_2 = game.player_2
        game.current_player = player_2
    
        expect { game.swap_player }.to change { game.current_player }.from(player_2).to(player_1)
      end
    end

    context 'when using getter methods on the object and @current_player is @player_2' do
      it 'changes @current_player to @player_2' do
        game = Game.new(board: Board.new, player_1: Player.new('X', 'Leslie'), player_2: Player.new('O', 'Gary'))
        player_1 = game.player_1
        player_2 = game.player_2
        game.current_player = player_1
    
        expect { game.swap_player }.to change { game.current_player }.from(player_1).to(player_2)
      end
    end
  end

  # Stuck on loop

  # describe '#start_game' do
  #   it 'returns true when end_game is true' do
  #     game = Game.new(board: Board.new, player_1: Player.new('X', 'Leslie'), player_2: Player.new('O', 'Gary'))
  #     allow(game.start_game).to receive(:end_game).and_return(true)
  #     expect(game.start_game).to be(true)
  #   end

  # end
end

describe Board do

  describe '#check_winning_combo' do

    it 'returns true with a winning combo' do
      game = Game.new(board: Board.new, player_1: Player.new('X', 'Leslie'), player_2: Player.new('O', 'Gary'))
      board = game.board
      allow(board).to receive(:check_winning_combo).and_return(true)
      expect(board.check_winning_combo).to be(true)
    end

    it 'returns false if no winning combo' do
      game = Game.new(board: Board.new, player_1: Player.new('X', 'Leslie'), player_2: Player.new('O', 'Gary'))
      board = game.board
      allow(board).to receive(:check_winning_combo).and_return(false)
      expect(board.check_winning_combo).to be(false)
    end
  end

  describe '#check_win' do

    it 'returns true when #check_winning_combo is true' do
      game = Game.new(board: Board.new, player_1: Player.new('X', 'Leslie'), player_2: Player.new('O', 'Gary'))
      board = game.board
      allow(board).to receive(:check_winning_combo).and_return(true)
      expect(board.check_win).to be(true)
    end
  end

  describe '#mark_position' do

    it 'returns true when #check_position is true' do
      game = Game.new(board: Board.new, player_1: Player.new('X', 'Leslie'), player_2: Player.new('O', 'Gary'))
      board = game.board
      allow(board).to receive(:check_position).and_return(true)
      expect(board.mark_position(9, 'X')).to be true
    end

    it 'returns false when #check_position is false' do
      game = Game.new(board: Board.new, player_1: Player.new('X', 'Leslie'), player_2: Player.new('O', 'Gary'))
      board = game.board
      allow(board).to receive(:check_position).and_return(false)
      expect(board.mark_position(2, 'O')).to be false
    end
  end

  describe '#check_position' do

    it 'returns true when the index of @positions array passed in from argument is a number' do
      game = Game.new(board: Board.new, player_1: Player.new('X', 'Leslie'), player_2: Player.new('O', 'Gary'))
      board = game.board
      allow(board).to receive(:check_position).and_return(true)
      expect(board.check_position(2)).to be true
    end
  end
end

describe Player do

  describe '#take_turn' do

    context 'when player chooses the valid number 3' do

      it 'returns variable of 3' do
        player = Player.new('X', 'Leslie')
        allow(player).to receive(:take_turn).and_return(3)
        expect(player.take_turn).to eq(3)
      end

    end
  end
end

