sum = 0
x = 1
y = 1
while x < 4000000
	new_num = x + y
	y = x
	x = new_num
	sum += x if x % 2 == 0
end

puts sum