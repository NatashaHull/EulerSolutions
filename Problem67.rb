def triangle_interp str
	triangle = str.split(/\n/)
	triangle.each_with_index { |row, i| triangle[i] = row.split(/\s/)}
end

def next_left(row, col, triangle)
	[[row+1, col], triangle[row+1][col]]
end

def next_right(row, col, triangle)
	[[row+1, col+1], triangle[row+1][col+1]]
end

def down(row, col, triangle)
	[next_left(row, col, triangle), next_right(row, col, triangle)]
end

def path_sums triangle
	max_depth = triangle.length
	node = [[0,0], triangle[0][0]]
	path = [node]
	result = 0
	while path[0][0][0] < max_depth
		node = path.pop
		location = node[0]
		num = node[1].to_i
		if num > result
			result = num
			puts result
		end
		if location[0] < max_depth - 1
			down(location[0], location[1], triangle).each do |successor|
				path << [successor[0], (num + (successor[1].to_i))]
			end
		end
	end
	path
end

triangle_str = File.readlines('triangle.txt').join
triangle_arr = triangle_interp(triangle_str)
triangle_paths = path_sums(triangle_arr)
triangle_sums = triangle_paths.map { |path| path[2] }
result = triangle_sums.sort.last
puts result[1]