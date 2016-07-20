require 'colorize'
require 'colorized_string'

require_relative 'checkwin'
require_relative 'instructions'
require_relative 'player'
require_relative 'gameplay'


Instructions.new
connect_four = GamePlay.new
first_player = connect_four.player1

connect_four.play_game(first_player)