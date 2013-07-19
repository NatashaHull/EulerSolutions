def is_palindrome? str
	result = true
	string = str.to_s
	i = 0
	j = string.length - 1
	while i <= j
		result = false if string[i] != string[j]
		i += 1
		j -= 1
	end
	result
end

x = 999
largest_palindrome = 0
while x >= 100
	y = 999
	while y >= 100
		if is_palindrome?(x * y) && (x * y) > largest_palindrome
			largest_palindrome = x * y
			break
		end
		y -= 1
	end
	x -= 1
end
puts largest_palindrome