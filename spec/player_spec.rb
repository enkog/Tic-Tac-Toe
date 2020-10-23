# spec/player_spec.rb

require_relative '../lib/player.rb'

RSpec.describe 'Player' do
  let(:player1) { Player.new('Nkiruka', 'X', 0) }
  let(:player2) { Player.new('Michael', 'O', 0) }

  it 'returns the player name' do
    expect(player1.name).to eq('Nkiruka')
  end

  it "returns the player's token" do
    expect(player2.token).to eq('O')
  end

  it "returns the player's move count" do
    expect(player1.move_count).to eq(0)
  end
end
