class Players
	attr_accessor :player1, :player2

	def initialize
		@player1 = {}
		@player2 = {}
end

class NewGame
	class << self
		def start
		 GamePlay.place_move
		end
	end
end

class GamePlay
	class << self
		def place_move
			puts "some stuff"
		end
	end
end

class CheckWins

	# given coordinates (m, n); winning pattern follows (m, n + 1)
	def vertical_win?(player_moves)
		game_over = false
		counter   = 0 

		sorted_moves = player_moves.sort
		sorted_moves.each_with_index do |coordinates, index|
			unless coordinates == sorted_moves.last
				if sorted_moves[index][0]     == sorted_moves[index + 1][0] && 
				   sorted_moves[index][1] + 1 == sorted_moves[index + 1][1]
					 	counter += 1
				end
			end
		end

		game_over = true if counter == 3
	end

	# given coordinates (m, n); winning pattern follows (m + 1, n)
	def horizontal_win?(player_moves)
		game_over = false
		counter   = 0

		sorted_moves = player_moves.sort
		sorted_moves.each_with_index do |coordinates, index|
			unless coordinates == sorted_moves.last
				if sorted_moves[index][0] + 1 == sorted_moves[index + 1][0] && 
				   sorted_moves[index][1]     == sorted_moves[index + 1][1]
					 	counter += 1
				end
			end
		end

		game_over = true if counter == 3
	end

	# given coordinates (m, n); winning pattern follows (m + 1, n + 1)
	def positive_slope_win?(player_moves)
		game_over = false
		counter   = 0

		sorted_moves = player_moves.sort
		sorted_moves.each_with_index do |coordinates, index|
			unless coordinates == sorted_moves.last
				if sorted_moves[index][0] + 1 == sorted_moves[index + 1][0] && 
				   sorted_moves[index][1] + 1 == sorted_moves[index + 1][1]
					 	counter += 1
				end
			end
		end

		game_over = true if counter == 3
	end

  # given coordinates (m, n); winning pattern follows (m - 1, n + 1)
	def negative_slope_win?(player_moves)
		game_over = false
		counter   = 0

		sorted_moves = player_moves.sort.reverse
		sorted_moves.each_with_index do |coordinates, index|
			unless coordinates == sorted_moves.last
				if sorted_moves[index][0] - 1 == sorted_moves[index + 1][0] && 
				   sorted_moves[index][1] + 1 == sorted_moves[index + 1][1]
					 	counter += 1
					 	next if counter == 3
				end
			end
		end

		game_over = true if counter == 3
	end
end

NewGame.start

=begin
@board = <<-eos 
6 │ - │ - │ - │ - │ - │ - │ - │
5 │ - │ - │ - │ - │ - │ - │ - │
4 │ - │ - │ - │ - │ - │ - │ - │
3 │ - │ - │ - │ - │ - │ - │ - │
2 │ - │ - │ - │ - │ - │ - │ - │
1 │ - │ - │ - │ - │ - │ - │ - │
  │ 1 │ 2 │ 3 │ 4 │ 5 │ 6 │ 7 │
eos


def place_move(x, y)
	i = @board.split("\n")
	
	i.each do |line|
		if line.include? y.to_s + " │ -"
			a = line.split()
			@counter = 0
			a.each_with_index do |i, j|
				@counter += 1 if i == '-'
				a[j] = "●" if i == '-' &&
				@counter == 5
			end
			p a.join
		end
	end
end

place_move(5, 1)

=end