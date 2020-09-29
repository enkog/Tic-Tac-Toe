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
end
