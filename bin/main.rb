#!/usr/bin/env ruby
puts 'WELCOME TO TIC-TAC-TOE GAME !!!'

  # create an empty game board
    @board = %w[1 2 3 4 5 6 7 8 9]

    # create game tokens as an array of 2 items
    @game_tokens = %w[X O]

    # create an empty hash to hold player and token info for each player
    # that is, player_one: 'X', player_two: 'O' or vice versa
    @assigned_tokens = {}
  

# register two players 
puts 'Player 1, input name: '
@player_one = gets.chomp

puts 'Player 2, input name: '
@player_two = gets.chomp

# allow first player choose a game token X or O
puts "#{player_one}, Choose a token: 'X' or 'O'"

while selected_token = gets.chomp
    selected_token = selected_token.upcase

    # validate the token chosen
    if !@game_tokens.to_s.include? selected_token
      puts "Invalid token, please select 'X' or 'O'"
    else
      # assign the selected_token to player_one and the other token to player_two
      @assigned_tokens[:player_one] = selected_token
      @assigned_tokens[:player_two] = selected_token == @game_tokens[0] ? @game_tokens[1] : @game_tokens[0]
      puts 'Tokens assigned successfully'
      puts "#{player_one}'s Token:  #{@assigned_tokens[:player_one]}"
      puts "#{player_two}'s Token:  #{@assigned_tokens[:player_two]}"
      break
    end
end

# display gameboard with available moves
# prompt current player to select a move which is an index
puts 'Enter a position: '
position = gets.chomp
puts position

# validate the position. If already taken or if out of available board index, display message and prompt for the input again.
# if position is valid, update board
board[index] = currentPlayersToken

# switch to next player's turn
# method for player turn will be called here, which will return the next player name whose turn it is to play.

# if current player move is up to three turns
# check for winning combination
# if current move matches winning combination
puts 'That is a winning combination'
# display winning player's name, end game

# otherwise pass turn to next player if board is not full
# if board is full check winning combination again to determine winner
# if no winner can be determined, then declare a draw, end game
