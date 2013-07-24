#Shortened solution attempt inspired by solution for problem 18
#Would take years to run
class Lattice
	def initialize dimensions
		@dimensions = dimensions.to_i
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
		until paths_array[0] == @dimensions
			@alt_location = @location
			@location = right
			paths_array[0] = @location
			path_num += 1
			@alt_location = down(@alt_location)
			paths_array[path_num] = @alt_location
		end
		p paths_array
		paths_array.select! { |x| x % @dimensions != 0 && !all_down?(x) }
		p paths_array
		paths_array.each do |path|
			@location = path
			until (path % @dimensions == 0) || all_down?(@location)
				@alt_location = @location
				@location = right
				path = @location
				path_num += 1
				@alt_location = down(@alt_location)
				paths_array << @alt_location unless all_down?(@alt_location)
			end
			puts path_num
		end
		puts path_num + 1
	end
	def all_down? location
		location > (@dimensions * (@dimensions - 1))
	end
end

lattice = Lattice.new(21)
lattice.paths