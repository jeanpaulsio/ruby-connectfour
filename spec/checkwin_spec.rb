require 'checkwin'

system 'clear' or system 'cls'

describe CheckWin do
	before(:context){ @checkwin = CheckWin.new }

	describe "#vertical_win?" do
		let(:player_moves) { [{x: 4, y: 1}, {x: 5, y: 1}, {x: 3, y: 2},
													{x: 4, y: 3}, {x: 6, y: 1}, {x: 2, y: 2},	
													{x: 2, y: 3}, {x: 1, y: 2},	{x: 2, y: 4},
													{x: 2, y: 5}] }

		context "when player has four connections" do
			it "returns 4" do
				actual = @checkwin.vertical_win?(player_moves)
				expect(actual).to eq(4)
			end
		end

		context "when player doesn't have four connections" do
			before { player_moves.pop }
			it "returns 1" do
				actual = @checkwin.vertical_win?(player_moves)
				expect(actual).to eq(1)
			end
		end
	end

	describe "#horizontal_win?" do
		let(:player_moves) { [{x: 3, y: 1}, {x: 4, y: 2}, {x: 2, y: 1},
													{x: 5, y: 2}, {x: 7, y: 1}, {x: 5, y: 3},
													{x: 1, y: 1}, {x: 1, y: 3}, {x: 7, y: 2},
													{x: 6, y: 2}] }

		context "when player has four connections" do
			it "returns 4" do
				actual = @checkwin.horizontal_win?(player_moves)
				expect(actual).to eq(4)
			end
		end

		context "when player doesn't have four connections" do
			before { player_moves.pop }
			it "returns 1" do
				actual = @checkwin.horizontal_win?(player_moves)
				expect(actual).to eq(1)
			end
		end
	end

	describe "#last_index" do
		let(:arr){ [{x: 1, y: 2}, {x: 5, y: 4}, {x: 3, y: 2}] }
		it "returns last value of index" do
			actual = @checkwin.last_index(arr)
			expect(actual).to eq( {x: 3, y: 2} )
		end
	end

	describe "#sort_by_x" do
		let(:player_moves){ [{x: 1, y: 2}, {x: 5, y: 4}, {x: 3, y: 2}] }
		it "returns values in ascending order" do
			actual = @checkwin.sort_by_x(player_moves)
			expect(actual).to eq( [{x: 1, y: 2}, {x: 3, y: 2}, {x: 5, y: 4}] )
		end
	end

	describe "#sort_by_y" do
		let(:player_moves){ [{x: 1, y: 4}, {x: 5, y: 1}, {x: 3, y: 3}] }
		it "returns values in ascending order" do
			actual = @checkwin.sort_by_y(player_moves)
			expect(actual).to eq( [{x: 5, y: 1}, {x: 3, y: 3}, {x: 1, y: 4}] )
		end
	end

	describe "#positive_slope_origin" do
		context "given any positive slope connections" do
			let(:player_moves) { [{x: 3, y: 1}, {x: 4, y: 2}, {x: 2, y: 1},
														{x: 5, y: 2}, {x: 7, y: 1}, {x: 5, y: 3},
														{x: 1, y: 1}, {x: 1, y: 3}, {x: 7, y: 2},
														{x: 6, y: 4}] }
			it "returns the largest connection's slope origin" do
				actual = @checkwin.positive_slope_origin(player_moves)
				expect(actual).to eq( [{x: 3, y: 1}] )
			end
		end

		context "given no positive slope connections" do
			let(:player_moves) { [{x: 3, y: 1}, {x: 4, y: 5}] }
			it "returns an empty array" do
				actual = @checkwin.positive_slope_origin(player_moves)
				expect(actual).to eq( [] )
			end
		end
	end

	describe "#count_positive_slope" do
		context "given an origin with four connections" do
			let(:player_moves) { [{x: 3, y: 1}, {x: 4, y: 2}, {x: 2, y: 1},
														{x: 5, y: 2}, {x: 7, y: 1}, {x: 5, y: 3},
														{x: 1, y: 1}, {x: 1, y: 3}, {x: 7, y: 2},
														{x: 6, y: 4}] }
			let(:ans)          { [{x: 3, y: 1}] }
			it "returns 4" do
				actual = @checkwin.count_positive_slope(ans, player_moves)
				expect(actual).to eq(4)
			end
		end

		context "given an origin with two connections" do
			let(:player_moves) { [{x: 3, y: 1}, {x: 4, y: 2}] }
			let(:ans)          { [{x: 3, y: 1}] }
			it "returns 2" do
				actual = @checkwin.count_positive_slope(ans, player_moves)
				expect(actual).to eq(2)
			end
		end

		context "given an empty array" do
			let(:player_moves) { [{x: 3, y: 1}, {x: 4, y: 2}] }
			let(:ans)          { [] }
			it "returns 0" do
				actual = @checkwin.count_positive_slope(ans, player_moves)
				expect(actual).to eq(0)
			end
		end
	end

	describe "#negative_slope_origin" do
		context "given any positive slope connections" do
			let(:player_moves) { [{x: 4, y: 1}, {x: 5, y: 1}, {x: 3, y: 2},
														{x: 4, y: 3}, {x: 6, y: 1}, {x: 2, y: 2},	
														{x: 2, y: 3}, {x: 1, y: 2},	{x: 2, y: 4},
														{x: 1, y: 4}] }
			it "returns the largest connection's slope origin" do
				actual = @checkwin.negative_slope_origin(player_moves)
				expect(actual).to eq( [{x: 4, y: 1}] )
			end
		end

		context "given no negative slope connections" do
			let(:player_moves) { [{x: 3, y: 1}, {x: 4, y: 5}] }
			it "returns an empty array" do
				actual = @checkwin.negative_slope_origin(player_moves)
				expect(actual).to eq( [] )
			end
		end
	end

	describe "#count_negative_slope" do
		context "given an origin with four connections" do
			let(:player_moves) { [{x: 4, y: 1}, {x: 5, y: 1}, {x: 3, y: 2},
														{x: 4, y: 3}, {x: 6, y: 1}, {x: 2, y: 2},	
														{x: 2, y: 3}, {x: 1, y: 2},	{x: 2, y: 4},
														{x: 1, y: 4}] }
			let(:ans)          { [{x: 4, y: 1}] }
			it "returns 4" do
				actual = @checkwin.count_negative_slope(ans, player_moves)
				expect(actual).to eq(4)
			end
		end

		context "given an origin with two connections" do
			let(:player_moves) { [{x: 4, y: 1}, {x: 3, y: 2}] }
			let(:ans)          { [{x: 4, y: 1}] }
			it "returns 2" do
				actual = @checkwin.count_negative_slope(ans, player_moves)
				expect(actual).to eq(2)
			end
		end

		context "given an empty array" do
			let(:player_moves) { [{x: 3, y: 1}, {x: 4, y: 2}] }
			let(:ans)          { [] }
			it "returns 0" do
				actual = @checkwin.count_negative_slope(ans, player_moves)
				expect(actual).to eq(0)
			end
		end
	end
end