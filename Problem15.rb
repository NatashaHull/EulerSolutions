#Solution attempt inspired by solution for problem 18
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
	def paths
		@location = 1
		paths_array = []
		path_num = 0
		paths_array << [@location]
		until paths_array[0].last == @dimensions
			@alt_location = @location
			@location = right
			paths_array[0] << @location
			path_num += 1
			paths_array[path_num] = []
			paths_array[0].each { |x| paths_array[path_num] << x }
			paths_array[path_num].pop
			@alt_location = down(@alt_location)
			paths_array[path_num] << @alt_location
		end
		paths_array.each do |path|
			next if path.last % @dimensions == 0
			@location = path.last
			until (@location % @dimensions == 0) || all_down?(@location)
				@alt_location = @location
				@location = right
				path << @location
				path_num += 1
				paths_array[path_num] = []
				path.each { |x| paths_array[path_num] << x }
				paths_array[path_num].pop
				@alt_location = down(@alt_location)
				paths_array[path_num] << @alt_location
			end
			puts path_num
		end
		puts path_num
	end
	def all_down? location
		location > (@dimensions * (@dimensions - 1))
	end
end

lattice = Lattice.new(20)
lattice.paths