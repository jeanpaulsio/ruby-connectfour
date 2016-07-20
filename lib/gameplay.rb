require 'colorize'
require 'colorized_string'

require_relative 'player'
require_relative 'checkwin'

class GamePlay
	attr_accessor :player1, :player2, :top, 
								:row6, :row5, :row4, :row3, :row2, :row1,
								:board, :all_moves, :checkwins

	def initialize
		@player1   = Player.new("Player 1", "◉")
		@player2   = Player.new("Player 2", "◯")

		@top       = <<-eos
  1   2   3   4   5   6   7
├───┼───┼───┼───┼───┼───┼───┤
eos
		@row6      = <<-eos
│ · │ · │ · │ · │ · │ · │ · │
├───┼───┼───┼───┼───┼───┼───┤
eos
		@row5      = <<-eos
│ · │ · │ · │ · │ · │ · │ · │
├───┼───┼───┼───┼───┼───┼───┤
eos
		@row4      = <<-eos
│ · │ · │ · │ · │ · │ · │ · │
├───┼───┼───┼───┼───┼───┼───┤
eos
		@row3      = <<-eos
│ · │ · │ · │ · │ · │ · │ · │
├───┼───┼───┼───┼───┼───┼───┤
eos
		@row2      = <<-eos
│ · │ · │ · │ · │ · │ · │ · │
├───┼───┼───┼───┼───┼───┼───┤
eos
		@row1      = <<-eos
│ · │ · │ · │ · │ · │ · │ · │
└───┴───┴───┴───┴───┴───┴───┘
eos
		
		@board     = [@top, @row6, @row5, @row4, @row3, @row2, @row1]
		@all_moves = []
		@checkwins = CheckWin.new
	end

	# TODO: give POODR Treatment + TDD
	def play_game(player)
		puts "\n#{player.name}'s Turn:"
		ans = player.take_turn

		if valid_column?(ans) && !column_full?(ans)
			row_number = find_row_to_place(ans)
			@all_moves << ans
			player.moves << {x: ans, y: row_number}
			
			target_row = get_row(row_number)
			new_row    = place_move(ans, target_row, player)
			place_row(new_row, row_number)
			
			clear_screen
			display_board

			game_over(player) if check_win(player)
			tie_game          if @all_moves.size == 42	
		else
			invalid_column(ans)
			play_game(player)
		end

		switch_players(player)
	end

	def switch_players(player)
		player = player == @player1 ? @player2 : @player1
		play_game(player)
	end

	def valid_column?(ans)
		(1..7).include? ans
	end

	def find_row_to_place(ans)
		@all_moves.count(ans) + 1
	end

	def column_full?(ans)
		@all_moves.count(ans) >= 6 
	end

	def get_row(num)
		@board.each { |line| @row = line if line == @board[-num] }
		@row
	end

	def place_move(col, row, player)
		arr = row.split('')
		case col
			when col = 1 then arr[2]  = player.symbol
			when col = 2 then arr[6]  = player.symbol
			when col = 3 then arr[10] = player.symbol
			when col = 4 then arr[14] = player.symbol
			when col = 5 then arr[18] = player.symbol
			when col = 6 then arr[22] = player.symbol
			when col = 7 then arr[26] = player.symbol
		else
			puts "try again"
		end
		arr.join
	end

	def place_row(row_with_token, row_number)
		@board[-row_number] = row_with_token
	end

	def check_win(player)
		i = checkwins.positive_slope_origin(player.moves)
		j = checkwins.negative_slope_origin(player.moves)

		checkwins.vertical_win?(player.moves)           == 4 ||
		checkwins.horizontal_win?(player.moves)         == 4 ||
		checkwins.count_positive_slope(i, player.moves) == 4 ||
		checkwins.count_negative_slope(j, player.moves) == 4
	end

	def invalid_column(col)
		puts "» Sorry, #{col} isn't a valid column\n"
	end

	def clear_screen
		system 'clear' or system 'cls'
	end

	def display_board
		colorize_board(@board)
	end

	def colorize_board(board)
		lines = board.map do |line|
			colorize = line.split('')
			colorize.map! do |char|
				if char =~ /\d/
					char.colorize(:white)
				elsif char == "◉"
					char.colorize(:red)
				elsif char == "◯"
					char = "◉".colorize(:yellow)
				elsif char =~ /\S/
					char.colorize(:cyan)
				else
					char
				end
			end
			colorize.join('')
		end
		puts lines
	end

	def game_over(player)
		puts "#{player.name} Wins!"
		exit
	end

	def tie_game
		puts "Tie Game! You played Yourself."
		exit
	end
end