multiples = []

x = 1

until x == 1000
	multiples << x if (x % 3 == 0) || (x % 5 == 0)
	x += 1
end

puts multiples.inject(:+)