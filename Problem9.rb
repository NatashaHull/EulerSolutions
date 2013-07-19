a = 1
b = 2
c = 3
until (a ** 2) + (b ** 2) == (c ** 2) && (a + b + c == 1000)
	b = a + 1
	while b < c
		c = 1000 - a - b
		break if (a ** 2) + (b ** 2) == (c ** 2)
		b += 1
	end
	a += 1 if (a ** 2) + (b ** 2) != (c ** 2)
end

puts a * b * c