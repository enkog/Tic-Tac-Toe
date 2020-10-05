#!/usr/bin/env ruby

puts 'WELCOME TO TIC-TAC-TOE GAME !!!'

# create an empty game board
@board = %w[1 2 3 4 5 6 7 8 9]

# create game tokens as an array of 2 items
@game_tokens = %w[X O]

# create an empty hash to hold player and token info for each player
@assigned_tokens = {}

# register two players
puts 'Player 1, input name: '
@player_one = gets.chomp

puts 'Player 2, input name: '
@player_two = gets.chomp

# allow first player choose a game token X or O
puts "#{@player_one}, Choose a token: 'X' or 'O'"
selected_token = gets.chomp.upcase

# validate the token chosen
if !@game_tokens.to_s.include? selected_token
  puts "Invalid token, please select 'X' or 'O'"
else
  # assign the selected_token to player_one and the other token to player_two
  puts 'Tokens assigned successfully'
  puts "#{@player_one}'s Token:  #{@assigned_tokens[:player_one]}"
  puts "#{@player_two}'s Token:  #{@assigned_tokens[:player_two]}"
end

no_winner = false
winner_found = false

# determine first player

# call current player method to determine who to play first

while winner_found || no_winner
  # display gameboard
  # prompt current player to select a move which is an index
  puts 'Enter a position: '
  position = gets.chomp
  puts position

  # validate the position. If already taken or if out of available board index,
  # display message and prompt for the input again.

  # if position is valid,
  # update board with the current player's token

  # if current player move is up to three turns
  # check for winning combination
  # if current move matches winning combination
  puts 'That is a winning combination'
  winner_found = true
  # display winning player's name, end game

  # else if board is full
  # check for winning combination
  # if winning combination is not found
  no_winner = true
  # then declare a draw.

  # else
  # call current player method to determine who to play next
end

# prompt the player to choose to play again or exit

puts 'Do you want to play again?'
puts 'y/n'
# Restart the game method if the player chooses y else exit the game
