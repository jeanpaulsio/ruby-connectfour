require 'colorize'
require 'colorized_string'

class Instructions
	attr_reader :title

	def initialize 
		@title = <<-eos


 ██████╗ ██████╗ ███╗   ██╗███╗   ██╗███████╗ ██████╗████████╗    ██╗  ██╗
██╔════╝██╔═══██╗████╗  ██║████╗  ██║██╔════╝██╔════╝╚══██╔══╝    ██║  ██║
██║     ██║   ██║██╔██╗ ██║██╔██╗ ██║█████╗  ██║        ██║       ███████║
██║     ██║   ██║██║╚██╗██║██║╚██╗██║██╔══╝  ██║        ██║       ╚════██║
╚██████╗╚██████╔╝██║ ╚████║██║ ╚████║███████╗╚██████╗   ██║            ██║
 ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═╝            ╚═╝
eos

		@display_board = <<-eos
  1   2   3   4   5   6   7
├───┼───┼───┼───┼───┼───┼───┤
│ · │ · │ · │ · │ · │ · │ · │
├───┼───┼───┼───┼───┼───┼───┤
│ · │ ·	│ · │ · │ · │ · │ · │
├───┼───┼───┼───┼───┼───┼───┤
│ · │ ·	│ · │ · │ · │ · │ · │
├───┼───┼───┼───┼───┼───┼───┤
│ · │ ·	│ · │ · │ · │ · │ · │
├───┼───┼───┼───┼───┼───┼───┤
│ · │ ·	│ · │ · │ · │ · │ · │
├───┼───┼───┼───┼───┼───┼───┤
│ · │ ·	│ · │ · │ · │ · │ · │
└───┴───┴───┴───┴───┴───┴───┘
eos
	
	display 
	end

	def display
		puts @title.colorize(:light_red)
		colorize(@display_board)

		puts "\n» GAME RULES\n".colorize(:white) +
		     "#{"» Player 1 game piece:".colorize(:white)} #{"◉".colorize(:red)}\n" +
		     "#{"» Player 2 game piece:".colorize(:white)} #{"◉".colorize(:yellow)}\n" + 
		     "» Players drop their token by typing in a column number\n".colorize(:white) +
		     "» 4 marks in a row wins\n".colorize(:white)
	end

	def colorize(board)
		colorize = board.split('')
		colorize.map! do |char|
			if char =~ /\d/
				char.colorize(:white)
			elsif char =~ /\S/
				char.colorize(:cyan)
			else
				char
			end
		end
		puts colorize.join('')
	end
end