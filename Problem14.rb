def collatz_sequence_length num
	length = 1
	until num == 1
		if num % 2 == 0
			num /= 2
		else
			num = (3 * num) + 1
		end
		length += 1
	end
	length
end

puts collatz_sequence_length(13)
num = 1
longest_sequence = 0
while num < 999999
	num += 1
	sequence_length = collatz_sequence_length(num)
	if sequence_length > longest_sequence
		longest_sequence = sequence_length
		val = num
	end
end
puts longest_sequence
puts val