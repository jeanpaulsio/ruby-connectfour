require 'player'

system 'clear' or system 'cls'

describe Player do
	subject(:player) { Player.new(name, symbol) }
	let(:name)    { :name }
	let(:moves)    { [] }
	let(:symbol)   { :symbol }

	it "initializes a new player" do
		expect(player).to be_an_instance_of(Player)
	end

	before { allow(player).to receive(:to_sym) }
	it "sets the player's name" do
		expect(player.name).to eq(name)
	end

	it "initializes an empty array for player moves" do
		expect(player.moves).to eq([])
	end

	it "sets the player's symbol" do
		expect(player.symbol).to eq(symbol)
	end

	describe "#take_turn" do
		subject(:take_turn) { player.take_turn }
		before do
			expect(player).to receive(:gets).and_return('4')
		end

		it "returns player's entered number" do
			expect(take_turn).to eq(4)
		end
	end
end