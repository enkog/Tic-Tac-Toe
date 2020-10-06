class Game
  def create_player(name, token)
    player = Player.new
    player.name = name
    player.token = token

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
  def select_token(player_one, player_two, game_tokens)
    assigned_tokens = {}
    puts "#{player_one}, Choose a token: 'X' or 'O'"
    selected_token = gets.chomp.upcase
    loop do
      if !game_tokens.include? selected_token
        puts "Invalid token, please select 'X' or 'O'"
        selected_token = gets.chomp.upcase
      else
        assigned_tokens[:player_one] = selected_token
        assigned_tokens[:player_two] = selected_token == game_tokens[0] ? game_tokens[1] : game_tokens[0]
        puts 'Good choice!!'
        puts "#{player_one}'s Token:  #{assigned_tokens[:player_one]}"
        puts "#{player_two}'s Token:  #{assigned_tokens[:player_two]}"
        break
      end
    end

    assigned_tokens
  end

  # returns board index where player's token is to be placed
  def input_to_index(chosen_index, board)
    # check token validity
    valid = valid_move(chosen_index, board)
    return board[chosen_index] if valid
  end

  # places player's token on the board
  def move(board_index, token, board)
    board[board_index] = token
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
  def switch_turn(last_token)
    next_token = nil
    next_token = last_token.token == 'X' ? 'O' : 'X'
      
    next_token
  end

  def turn_count(curr_player)
    curr_player.token
  end

  def check_winning(player, board, _winning_combination)
    if player.move_count == 3
      token = player.token
      token_positions = find_token_indices(token, board)

    end
  end

  def find_token_indices(token, board)
    token_positions = []

    board.each_with_index do |item, index|
      token_positions << index if item == token
    end

    token_positions
  end
end
