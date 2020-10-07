#!/usr/bin/env ruby
require_relative '../lib/game.rb'

WINNING_COMBINATION = [
  [0, 1, 2], # top row
  [3, 4, 5], # middle row
  [6, 7, 8], # bottom row
  [0, 4, 8], # left to right diagonal
  [2, 4, 6], # right to left diagonal
  [0, 3, 6], # left-most column
  [1, 4, 7], # middle column
  [2, 5, 8] # right-most column
].freeze

board = %w[1 2 3 4 5 6 7 8 9]
game_tokens = %w[X O]
game = Game.new

puts 'Welcome to tic tac toe game'

# register the players
puts 'Player 1, input name: '
player_one_name = gets.chomp

puts 'Player 2, input name: '
player_two_name = gets.chomp

player_one = game.create_player(player_one_name, nil, 0)
player_two = game.create_player(player_two_name, nil, 0)

# allow players to chose their tokens
game.select_tokens(player_one, player_two, game_tokens)

puts 'Let the game begin !!!'
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
  game.display_board(board)

  puts 'Enter a position: '
  position = gets.chomp

  # translate player's input into board index
  board_index = game.input_to_index(position.to_i, board)

  # update board with the current player's token at chosen board index
  board_position = board_index.pred
  board[board_position] = current_token
  last_token = current_token
  current_player.move_count += 1

  # display current board after player's entry
  game.display_board(board)

  # if current player move is up to three turns
  next unless current_player.move_count >= 3

  # check for winner
  winner_found = game.check_winning(current_player, board, WINNING_COMBINATION)

  if winner_found
    puts "#{current_player.name} has won"
    break
  else
    is_board_full = game.check_board_full(board, game_tokens)
    if is_board_full
      winner_found = game.check_winning(current_player, board, WINNING_COMBINATION)
    elsif winner_found
      puts "#{current_player.name} has won"
      break
    else
      # draw
      no_winner = true
      puts 'There is a tie'
      break
    end
  end

end
