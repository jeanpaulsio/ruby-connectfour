require 'connectfour'

describe Players do
	pending
end

describe NewGame do
	describe "#start" do
		pending
	end
end

describe GamePlay do
	describe "#place_move" do
		pending
	end
end

describe CheckWins do
	before(:context){ @game = CheckWins.new }

	describe "#vertical_win?" do
		let(:player_moves) { [[4,2], [4,1], [4,4], [4,3]] }

		it "returns true for a vertical win" do
			actual = @game.vertical_win?(player_moves)
			expect(actual).to be true
		end
	end

	describe "#horizontal_win?" do
		let(:player_moves) { [[1,4], [4,4], [3,4], [2,4]] }

		it "returns true for a horizontal win" do
			actual = @game.horizontal_win?(player_moves)
			expect(actual).to be true
		end
	end

	describe "#positive_slope_win?" do 
		let(:player_moves) { [[4,5], [2,3], [5,6], [3,4]] }

		it "returns true for a positive slope win" do
			actual = @game.positive_slope_win?(player_moves)
			expect(actual).to be true
		end
	end

	describe "#negative_slope_win?" do
		let(:player_moves) { [[1,4], [4,1], [2,3], [3,2]] }

		it "returns true for a negative slope win" do
			actual = @game.negative_slope_win?(player_moves)
			expect(actual).to be true
		end
	end
end