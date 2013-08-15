def number_spiral_diagonals(num)
	result = 1
	next_num = 1
	2.step(num, 2) do |difference|
		4.times do
			next_num += difference
			result += next_num
		end
	end
	result
end
puts number_spiral_diagonals(5)
puts number_spiral_diagonals(1001)