class Player
	attr_reader :name, :symbol
	attr_accessor :moves

	def initialize(name, symbol)
		@name   = name
		@moves  = []
		@symbol = symbol
	end

	def take_turn
		puts "» Choose a column number"
		ans = gets.to_i
	end
end