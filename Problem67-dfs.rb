#This was my attempt to solve problem 67 with Depth-First Search, until I
#realized that dfs would take twenty-billion years to solve the problem.
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
	while path.length > 0
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
	result
end

triangle_str = File.readlines('triangle.txt').join
triangle_arr = triangle_interp(triangle_str)
triangle_sum = path_sums(triangle_arr)
puts triangle_sum