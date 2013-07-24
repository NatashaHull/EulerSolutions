#Mathematical solution
def paths lattice_length
	xy = []
	xy[0] = [0]
	lattice_length.times do
		xy[0] << 1
		xy << [1]
	end
	xy[1][1] = xy[1][0] + xy[0][1]
	1.upto(lattice_length) do |x|
		1.upto(lattice_length) do |y|
			xy[x][y] = xy[x-1][y] + xy[x][y-1]
		end
	end
	xy.last.last
end
puts paths(20)