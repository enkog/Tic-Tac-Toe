#!/usr/bin/env ruby
class Game
  puts 'WELCOME TO TIC-TAC-TOE GAME !!!'
  puts
  attr_accessor :player_one, :player_two, :board # Getter and Setter methods

  # initialize instance variables
  def initialize(player_one, player_two)
    @board = %w[1 2 3 4 5 6 7 8 9]
    @player_one = player_one
    @player_two = player_two
    @game_tokens = %w[X O]
    @assigned_tokens = {}
  end

  # Display the game board
  def display_board(_board)
    puts 'LET THE GAME BEGIN!'
    puts
    puts " #{@board[0]}  | #{@board[1]}  | #{@board[2]}"
    puts '-------------'
    puts " #{@board[3]}  | #{@board[4]}  | #{@board[5]}"
    puts '-------------'
    puts " #{@board[6]}  | #{@board[7]}  | #{@board[8]}"
  end

  # player-1 selects a token and the other token is assigned to player-2
  def select_token
    puts "#{player_one}, Choose a token: 'X' or 'O'"
    while selected_token == gets
      selected_token = selected_token.chomp.upcase
      if !@game_tokens.to_s.include? selected_token
        puts "Invalid token, please select 'X' or 'O'"
      else
        @assigned_tokens[:player_one] = selected_token
        @assigned_tokens[:player_two] = if selected_token == @game_tokens[0]
                                          @game_tokens[1]
                                        else
                                          @game_tokens[0]
                                        end
        puts 'Good choice!!'
        puts "#{player_one}'s Token:  #{@assigned_tokens[:player_one]}"
        puts "#{player_two}'s Token:  #{@assigned_tokens[:player_two]}"
        break
      end
    end
  end

  # players inputs where they would like to go on the board
  def input_to_index(board, curr_player)
    puts " #{curr_player} (#{@assigned_tokens[curr_player]}), choose a position from 1 to 9 to place your token"
    chosen_index = gets.chomp
    # check token validity
    valid = validMove(chosen_index, board)
    @board[chosen_index] = @assigned_tokens[curr_player] if valid
  end

  # checks if players made valid moves
  def valid_move(index, board)
    if (board[index].is_a? Integer) && (1..9).include?(index)
      true
    else
      false
    end
  end

  def current_player
    # dictates the current player in the game
  end

  def turn
    # Controlling valid and invalid moves
  end

  def turn_count
    # Controlling the number of turns played
  end
end

# accept and display player name
puts 'Player 1, input name: '
player_one = gets.chomp.upcase
puts 'Player 2, input name: '
player_two = gets.chomp.upcase
