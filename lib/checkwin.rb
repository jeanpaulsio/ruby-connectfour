class CheckWin
	attr_reader :winning_connection_count

	def initialize
		@winning_connection_count = 4
	end

	# given (m, n) -> winning pattern (m, n+1)
	def vertical_win?(player_moves)
		counter = 1
		sorted_moves = sort_by_x(player_moves)

		sorted_moves.each_with_index do |pair, index|
			next_index = sorted_moves[index + 1]
			
			unless pair == last_index(sorted_moves)
		  	if pair[:x] == next_index[:x] && pair[:y].next == next_index[:y]
				   	counter += 1
				else
				   	counter = 1
				end	
				break if counter == @winning_connection_count
			end
		end
		counter
	end

	# given (m, n) -> winning pattern (m+1, n)
	def horizontal_win?(player_moves)
		counter = 1
		sorted_moves = sort_by_y(player_moves)

		sorted_moves.each_with_index do |pair, index|
			next_index = sorted_moves[index + 1]
			
			unless pair == last_index(sorted_moves)
		  	if pair[:y] == next_index[:y] && pair[:x].next == next_index[:x]
				   	counter += 1
				else
				   	counter = 1
				end	
				break if counter == @winning_connection_count
			end
		end
		counter
	end

	def last_index(arr)
		arr.last
	end

	def sort_by_x(player_moves)
		player_moves.sort { |a, b| [a[:x], a[:y]] <=> [b[:x], b[:y]] }
	end

	def sort_by_y(player_moves)
		player_moves.sort { |a, b| [a[:y], a[:x]] <=> [b[:y], b[:x]] }
	end

	# given (m, n) -> winning pattern (m+1, n+1)
	def positive_slope_origin(player_moves)
		possible_wins = []

		player_moves.each do |pair|
			possible_wins << pair if player_moves.include?({ x: pair[:x]+1, y: pair[:y]+1 })
		end

		return possible_wins                 if possible_wins.size < 2
		positive_slope_origin(possible_wins) if possible_wins.size > 1
	end

	def count_positive_slope(ans, player_moves)
		return 0 if ans == []

		compare = ans[0]
		counter = 1

		player_moves.each do |pair|
			if player_moves.include?({ x: compare[:x]+1, y: compare[:y]+1 })
				counter += 1
				compare  = { x: compare[:x]+1, y: compare[:y]+1 }
			end
		end

		counter
	end

	# given (m, n) -> winning pattern (m-1, n+1)
	def negative_slope_origin(player_moves)
		possible_wins = []

		player_moves.each do |pair|
			possible_wins << pair if player_moves.include?({ x: pair[:x]-1, y: pair[:y]+1 })
		end

		return possible_wins                 if possible_wins.size < 2
		negative_slope_origin(possible_wins) if possible_wins.size > 1
	end

	def count_negative_slope(ans, player_moves)
		return 0 if ans == []

		compare = ans[0]
		counter = 1

		player_moves.each do |pair|
			if player_moves.include?({ x: compare[:x]-1, y: compare[:y]+1 })
				counter += 1
				compare  = { x: compare[:x]-1, y: compare[:y]+1 }
			end
		end

		counter
	end
end