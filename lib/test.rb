class Game
  puts 'WELCOME TO TIC-TAC-TOE GAME !!!'
  attr_accessor :player_one, :player_two, :board
  # initialize instance variables
  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @game_tokens = %w[X O]
    @assigned_tokens = {}
  end

  # accept and display player name
  def player_name
    puts 'Player 1, input name: '
    @player_one = gets.chomp.upcase

    puts 'Player 2, input name: '
    @player_two = gets.chomp.upcase
  end

  # players inputs where they would like to go on the board

  def win(_player)
    puts 'Yay..!! won.'
  end

  def draw
    puts "It's draw match!!"
  end
end
play = Game.new(:player_one, :player_two)
p play.player_name
p play.select_token
