def n! n
	product = 1
	i = n
	while i > 0
		product *= i
		i -= 1
	end
	product
end

def sum_of_digits num
	digits = num.to_s.split('')
	sum = 0
	digits.each { |digit| sum += digit.to_i }
	sum
end

puts sum_of_digits(n!(100))