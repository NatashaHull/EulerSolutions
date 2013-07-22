fibonacci_numbers = [1, 1]
x = 1
y = 1
while x.to_s.length < 1000
	new_num = x + y
	y = x
	x = new_num
	fibonacci_numbers << x
end

puts fibonacci_numbers.length