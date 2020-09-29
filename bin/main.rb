#!/usr/bin/env ruby
class UserInterface
  puts "WELCOME TO TIC-TAC-TOE GAME"
  puts
  attr_accessor :player_one, :player_two, :board

  def initialize(player_one, player_two)
    @board = %w[# # # # # # # # #]
    @player_one = player_one
    @player_two = player_two
    @token = ['X','O']
  end

  def player_name
    print "Enter your name(player_one): "
    player_one = gets.chomp.upcase
    print "Enter your name(player_two): "
    player_two = gets.chomp.upcase
    puts ""
    puts "#{player_one} VS #{player_two}"
  end

  def display_board(board)
    puts "LET THE GAME BEGIN!"
    puts
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts "---------"
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts "---------"
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
  end
end
