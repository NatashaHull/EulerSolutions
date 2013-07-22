def sum_of_digits num
	digits = num.to_s.split('')
	digits.each_with_index { |num, i| digits[i] = num.to_i }
	digits.inject(:+)
end

num = 2 ** 1000
puts sum_of_digits(num)