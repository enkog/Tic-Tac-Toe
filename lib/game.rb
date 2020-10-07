#!/usr/bin/env ruby
require_relative '../lib/player.rb'
class Game
  def create_player(name, token, move_count)
    player = Player.new(name, token, move_count)
    player
  end

  # Display the game board
  def display_board(board)
    puts " #{board[0]}  | #{board[1]}  | #{board[2]}"
    puts '-------------'
    puts " #{board[3]}  | #{board[4]}  | #{board[5]}"
    puts '-------------'
    puts " #{board[6]}  | #{board[7]}  | #{board[8]}"
  end

  # player-1 selects a token and the other token is assigned to player-2
  def select_tokens(player_one, player_two, game_tokens)
   
    puts "#{player_one.name}, Choose a token: 'X' or 'O'"
    selected_token = gets.chomp.upcase
    loop do
      if !game_tokens.include? selected_token
        puts "Invalid token, please select 'X' or 'O'"
        selected_token = gets.chomp.upcase
      else
        player_one.token = selected_token
        player_two.token = selected_token == game_tokens[0] ? game_tokens[1] : game_tokens[0]
       
        puts 'Good choice!!'
        puts "#{player_one.name}'s Token:  #{player_one.token}"
        puts "#{player_two.name}'s Token:  #{player_two.token}"
        break
      end
    end

    
  end

  # returns board index where player's token is to be placed
  def input_to_index(chosen_index, board)
    # check token validity
    valid = valid_move(chosen_index, board)
    return board[chosen_index] if valid
  end

  # checks if players made valid moves
  def valid_move(index, board)
    if (board[index].is_a? Integer) && (1..9).include?(index)
      true
    else
      false
    end
  end

  # returns next token to be played
  def switch_turn(player_one, player_two, last_token)
    next_token = nil

    if last_token.nil?
      next_token = player_one.token
    else
      if last_token == player_one.token
        next_token = player_two.token
      elsif last_token == player_two.token
        next_token = player_one.token
      end
    end

    next_token
  end

  def check_board_full(board)
    full = false

    board.each do |index|
      if (1..9).include?(index)
        full = true
        break
      end
    end

    full
  end

  def check_winning(player, board, winning_combination)
    winner_found = false
    if player.move_count >= 3
      token = player.token

      winning_combination.each do |item|
        winning_token_count = 0
        item.each do |board_index|
          winning_token_count += 1 if board[board_index] == token
        end
        if winning_token_count == 3
          winner_found = true
          break
        end
      end
    end

    winner_found
  end
end
