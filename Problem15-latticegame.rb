class Lattice
	def initialize dimensions
		puts "Welcome to the #{dimensions} by #{dimensions} lattice game."
		@dimensions = dimensions.to_i
		@location = 1
		play
	end
	def right
		if @location % @dimensions == 0
			@all_right = true
			puts "Cannot move in that direction"
		else
			@location += 1
		end
		puts "Your location number is #{@location}"
	end
	def down
		if @location >= (@dimensions * (@dimensions - 1))
			@all_down = true
			puts "Cannot move in that direction"
		else
			@location += @dimensions
		end
		puts "Your location number is #{@location}"
	end
	def play
		until @location == (@dimensions ** 2)
			puts "Pick a direction to go!"
			direction = gets.chomp
			if direction.downcase == "right"
				right
			elsif direction.downcase == "down"
				down
			else
				puts "This is an invalid direction.  Please pick again."
			end
		end
		puts "Game over!"
	end
end

puts "Pick the size of a lattice:"
num = gets.chomp
lattice = Lattice.new(num)