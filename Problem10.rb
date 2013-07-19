def is_prime? num
	result = true
	i = 2
	while i ** 2 <= num
		if num % i == 0
			result = false
			break
		end
		i += 1
	end
	result
end

def sum_of_primes num
	i = 2
	primes_sum = 0
	while i < num
		primes_sum += i if is_prime?(i)
		if i % 2 == 0
			i += 1
		else
			i += 2
		end
	end
	primes_sum
end

puts sum_of_primes(10)
puts sum_of_primes(2000000)