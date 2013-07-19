def sum_of_squares(num1, num2)
	sum = 0
	while num1 <= num2
		sum += (num1 ** 2)
		num1 += 1
	end
	sum
end

def square_of_sums(num1, num2)
	sum = 0
	while num1 <= num2
		sum += num1
		num1 += 1
	end
	sum ** 2
end

sum_to_ten = sum_of_squares(1, 10)
square_to_ten = square_of_sums(1, 10)
puts square_to_ten - sum_to_ten

sum_to_hundred = sum_of_squares(1, 100)
square_to_hundred = square_of_sums(1, 100)
puts square_to_hundred - sum_to_hundred