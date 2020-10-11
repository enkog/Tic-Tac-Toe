#!/usr/bin/env ruby
require_relative '../lib/player.rb'

class Game
  attr_accessor :board, :game_tokens

  def initialize
    @board = %w[1 2 3 4 5 6 7 8 9]
    @game_tokens = %w[X O]
  end

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

  def create_player(name, token, move_count)
    player = Player.new(name, token, move_count)
    player
  end

  # returns board index where player's token is to be placed
  def input_to_index(chosen_index, board, get_position)
    # check token validity
    valid = valid_move(chosen_index, board)
    until valid
      get_position.call
      chosen_index = gets.chomp.to_i
      valid = valid_move(chosen_index, board)
      break if valid
    end

    chosen_index if valid
  end

  # checks if players made valid moves
  def valid_move(index, board)
    valid = false
    board_index = index.pred
    valid = true unless board[board_index] == 'X' || board[board_index] == 'O'

    valid
  end

  # returns next token to be played
  def switch_turn(player_one, player_two, last_token)
    next_token = nil

    if last_token.nil?
      next_token = player_one.token
    elsif last_token == player_one.token
      next_token = player_two.token
    elsif last_token == player_two.token
      next_token = player_one.token
    end

    next_token
  end

  def check_board_full(board)
    full = true

    board.each do |item|
      unless @game_tokens.include?(item)
        full = false
        break
      end
    end
    full
  end

  def update_board(board_index, board, current_token, current_player)
    board_position = board_index.pred
    board[board_position] = current_token
    current_player.move_count += 1
  end

  def check_winning(player, board)
    winner_found = false
    if player.move_count >= 3
      token = player.token

      WINNING_COMBINATION.each do |item|
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
