def triangle_interp str
	triangle = str.split(/\n/)
	triangle.each_with_index { |row, i| triangle[i] = row.split(/\s/)}
end

def next_left(row, col, triangle)
	triangle[row+1][col]
end

def next_right(row, col, triangle)
	triangle[row+1][col+1]
end

def down(row, col, triangle)
	[next_left(row, col, triangle), next_right(row, col, triangle)]
end

def paths triangle
	max_depth = triangle.length
	at_max_depth = false
	paths = Array.new([])
	path_num = 0
	until at_max_depth
		paths[path_num] = [triangle[0][0]]
		0.upto(max_depth-2) do |i|
			paths[0] << next_left(i, 0, triangle)
			path_num += 1
			paths[path_num] = []
			paths[0].each_with_index { |x, j| paths[path_num] << x if j != (i + 1) }
			paths[path_num] << next_right(i, 0, triangle)
		end
		paths.each do |path|
			i = path.length - 1
			until i == max_depth-1
				col = triangle[i].index(path.last)
				path << next_left(i, col, triangle)
				path_num += 1
				paths[path_num] = []
				path.each_with_index { |x, j| paths[path_num] << x if j != (i + 1) }
				paths[path_num] << next_right(i, col, triangle)
				i += 1
			end
		end
		at_max_depth = true
	end
	paths
end

def array_sum arr
	sum = 0
	arr.each { |num| sum += num.to_i }
	sum
end

triangle_str = "75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23"
triangle_arr = triangle_interp(triangle_str)
max_depth = triangle_arr.length
triangle_paths = paths(triangle_arr)
path_num = triangle_paths.length
max_path_sum = 0
triangle_paths.each { |path| max_path_sum = array_sum(path) if array_sum(path) > max_path_sum }
puts max_path_sum