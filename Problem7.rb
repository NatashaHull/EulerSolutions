def is_prime? num
	result = true
	i = 2
	while i < num
		if num % i == 0
			result = false
			break
		end
		i += 1
	end
	result
end

def nth_prime num
	prime = 0
	i = 1
	until prime == num
		i += 1
		prime += 1 if is_prime?(i)
	end
	i
end

puts nth_prime(6)
puts nth_prime(10001)