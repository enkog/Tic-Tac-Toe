#!/usr/bin/env ruby
require_relative '../lib/game.rb'

game = Game.new

# Display the game board
def display_board(board)
  puts " #{board[0]}  | #{board[1]}  | #{board[2]}"
  puts '-------------'
  puts " #{board[3]}  | #{board[4]}  | #{board[5]}"
  puts '-------------'
  puts " #{board[6]}  | #{board[7]}  | #{board[8]}"
end

puts 'WELCOME TO TIC-TAC-TOE GAME !!!'
puts

# register the players
puts 'Player 1, input your name: '
player_one_name = gets.chomp

puts 'Player 2, input name: '
player_two_name = gets.chomp
puts
player_one = game.create_player(player_one_name, nil, 0)
player_two = game.create_player(player_two_name, nil, 0)

# allow players to chose their tokens
puts "#{player_one.name}, Choose a token: 'X' or 'O'"
selected_token = gets.chomp.upcase

loop do
  if !game.game_tokens.include? selected_token
    puts "Invalid token, please select 'X' or 'O'"
    selected_token = gets.chomp.upcase
  else
    player_one.token = selected_token
    player_two.token = selected_token == game.game_tokens[0] ? game.game_tokens[1] : game.game_tokens[0]

    puts 'Good choice!!'
    puts
    puts "#{player_one.name}'s Token:  #{player_one.token}"
    puts "#{player_two.name}'s Token:  #{player_two.token}"
    break
  end
end

puts
puts 'LET THE GAME BEGIN !!!'
puts

# take players' inputs for game play
no_winner = false
winner_found = false
last_token = nil
current_player = nil

while !winner_found || !no_winner

  # prompt current player to select a move which is an index
  current_token = game.switch_turn(player_one, player_two, last_token)

  if current_token == player_one.token
    current_player = player_one
    puts "#{player_one.name}'s Turn (#{current_token})"
  else
    current_player = player_two
    puts "#{player_two.name}'s Turn (#{current_token})"
  end

  # display current board before player's entry
  display_board(game.board)

  puts 'Enter a position: '
  position = gets.chomp

  # translate player's input into board index
  board_index = game.input_to_index(position.to_i, game.board)

  # update board with the current player's token at chosen board index
  game.update_board(board_index, game.board, current_token, current_player)
  last_token = current_token

  # display current board after player's entry
  display_board(game.board)
  is_board_full = game.check_board_full(game.board)

  if is_board_full
    winner_found = game.check_winning(current_player, game.board)
    if winner_found
      puts "#{current_player.name} has won"
    else
      # draw
      no_winner = true
      puts 'There is a tie'
    end
    break
  elsif current_player.move_count >= 3
    # check for winner
    winner_found = game.check_winning(current_player, game.board)
    if winner_found
      puts "#{current_player.name} has won"
      break
    end
  end
end
