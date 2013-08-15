#Solution after looking up mathematical methods for determining recicrpocal
#cycle length
def reciprocal_cycles num
	first_digit = 1 % num
	prior_digits = [first_digit]
	unless first_digit == 0
		i = (first_digit * 10) % num
		cycle = 1
		until prior_digits.include?(i) || i == 0
			prior_digits << i
			cycle += 1
			i = (i * 10) % num
		end
		cycle = 0 if i == 0
	end
	cycle
end

longest_reciprocal_cycle = 0
result = 0
2.upto(999) do |d|
	cycle = reciprocal_cycles(d)
	if cycle > longest_reciprocal_cycle
		longest_reciprocal_cycle = cycle
		result = d
	end
	d += 1
end
puts longest_reciprocal_cycle
puts result