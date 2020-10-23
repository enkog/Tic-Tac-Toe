# spec/game_spec.rb

require_relative '../lib/player.rb'
require_relative '../lib/game.rb'

RSpec.describe 'Game' do
  let(:player1) { game.create_player('Nkiruka', 'X', 0) }
  let(:player2) { game.create_player('Alix', 'O', 0) }
  let(:game) { Game.new }
  let(:my_proc) { proc { puts 'Invalid position, please enter another position ...' } }

  it 'displays the board' do
    expect(game.board).to eql(%w[1 2 3 4 5 6 7 8 9])
  end

  describe '#input_to_index' do
    it "returns player's chosen index" do
      expect(game.input_to_index(2, game.board, my_proc)).to eql(2)
    end
  end

  describe '#valid_move' do
    it 'assigns the array index to board index' do
      expect(game.board[1]).to eq('2')
    end

    it 'returns true when the position is not yet chosen' do
      expect(game.valid_move(2, %w[1 2 3 4 5 6 7 8 9])).to eql(true)
    end

    it 'returns false when the position is already chosen' do
      expect(game.valid_move(4, %w[1 2 3 X 5 6 7 8 9])).to eql(false)
    end
  end

  describe '#switch_turn' do
    it 'player one takes the first turn' do
      expect(game.switch_turn(player1, player2, nil)).to eql('X')
    end
    it 'determines the next player' do
      expect(game.switch_turn(player1, player2, 'X')).to eql('O')
    end
    it 'determines the next player' do
      expect(game.switch_turn(player1, player2, 'O')).to eql('X')
    end
  end

  describe '#check_winning' do
    it 'returns true when player has 3 moves which matches combinations' do
      player1.move_count = 3
      expect(game.check_winning(player1, %w[X X X 4 5 O 7 O 9])).to eq(true)
    end
    it 'returns false since player move is less than 3' do
      player1.move_count = 3
      expect(game.check_winning(player1, %w[X O X 4 5 6 7 8 9])).to eq(false)
    end
    it 'returns true when player move matches combination' do
      player2.move_count = 3
      expect(game.check_winning(player2, %w[X O X 4 O 6 7 O 9])).to eq(true)
    end
  end
end
