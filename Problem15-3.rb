#Experimenting with half the lattice
class Lattice
	def initialize dimensions
		@dimensions = dimensions.to_i + 1
		@location = 1
		@alt_location = 1
	end
	def right(location = @location)
		if @location % @dimensions == 0
			@all_right = true
		else
			location += 1
		end
		location
	end
	def down(location = @location)
		location += @dimensions unless all_down?(location)
		location
	end
	def middle
		result = []
		round = 1
		0.upto(@dimensions-1) do |x|
			result << (round * @dimensions) - x
			round += 1
		end
		p result
		result
	end
	def paths
		@location = 1
		middle_arr = middle
		paths_array = []
		path_num = 0
		until paths_array[0] == @dimensions
			@alt_location = @location
			@location = right
			paths_array[0] = @location
			path_num += 1
			@alt_location = down(@alt_location)
			paths_array[path_num] = @alt_location
		end
		p paths_array
		paths_array.select! { |x| !middle_arr.include?(x) }
		p paths_array
		paths_array.each do |path|
			@location = path
			until middle_arr.include?(@location)
				@alt_location = @location
				@location = right
				path = @location
				path_num += 1
				@alt_location = down(@alt_location)
				paths_array << @alt_location unless middle_arr.include?(@alt_location)
				puts path_num
			end
		end
		puts (path_num + 1) * 2
	end
	def all_down? location
		location > (@dimensions * (@dimensions - 1))
	end
end

lattice = Lattice.new(20)
lattice.paths