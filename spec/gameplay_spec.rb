require 'gameplay'
require 'player'

system 'clear' or system 'cls'

describe GamePlay do
	subject(:gameplay) { GamePlay.new }
	let(:top) { <<-eos
  1   2   3   4   5   6   7
├───┼───┼───┼───┼───┼───┼───┤
eos
	}
	let(:row6) { <<-eos
│ · │ · │ · │ · │ · │ · │ · │
├───┼───┼───┼───┼───┼───┼───┤
eos
	}
	let(:row5) { <<-eos
│ · │ · │ · │ · │ · │ · │ · │
├───┼───┼───┼───┼───┼───┼───┤
eos
	}
	let(:row4) { <<-eos
│ · │ · │ · │ · │ · │ · │ · │
├───┼───┼───┼───┼───┼───┼───┤
eos
	}
	let(:row3) { <<-eos
│ · │ · │ · │ · │ · │ · │ · │
├───┼───┼───┼───┼───┼───┼───┤
eos
	}
	let(:row2) { <<-eos
│ · │ · │ · │ · │ · │ · │ · │
├───┼───┼───┼───┼───┼───┼───┤
eos
	}
	let(:row1) { <<-eos
│ · │ · │ · │ · │ · │ · │ · │
└───┴───┴───┴───┴───┴───┴───┘
eos
	}
	let(:board) { [top, row6, row5, row4, row3, row2, row1] }

	it "initializes a new game" do
		expect(gameplay).to be_an_instance_of(GamePlay)
	end

	describe "#valid_column?" do
		context "when given a number 1-7" do
			it "returns true" do
				expect(gameplay.valid_column?(7)).to be true
			end
		end

		context "when given a number not within 1-7" do
			it "returns false" do
				expect(gameplay.valid_column?(0)).to be false
				expect(gameplay.valid_column?(8)).to be false
				expect(gameplay.valid_column?("a")).to be false
			end
		end
	end

	describe "#find_row_to_place" do
		before { gameplay.all_moves = [3, 3, 3, 2, 1] } 
		context "when given a valid column number" do
			it "finds the row to place token" do
				expect(gameplay.find_row_to_place(3)).to eq(4)
			end
		end
	end

	describe "column_full?" do
		before { gameplay.all_moves = [1, 1, 1, 1, 1, 1] } 
		context "when given a full column" do
			it "returns true" do
				expect(gameplay.column_full?(1)).to be true
			end
		end

		context "when given a column that isn't full" do
			it "returns false" do
				expect(gameplay.column_full?(3)).to be false
			end
		end
	end

	describe "#get_row" do
		it "fetches the given row" do
			expect(gameplay.get_row(4)).to eq(row4)
		end
	end

	describe "#place_move" do
		before do
			Temp = Struct.new(:symbol)
			@player1 = Temp.new("x")
		end

		context "when given a row" do
			it "places player's symbol in correct column" do
				expect(gameplay.place_move(4, row1, @player1)).to eq(
<<-eos
│ · │ · │ · │ x │ · │ · │ · │
└───┴───┴───┴───┴───┴───┴───┘
eos
					)
			end
		end
	end

end