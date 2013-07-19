def largest_prime_factor num
	prime_factors(num).max
end

def prime_factors num
	prime_factors = []
	factor = 2
	while factor <= num
		if num % factor == 0 && is_prime?(factor)
			prime_factors << factor
			num /= factor
		end
		factor += 1
	end
	prime_factors
end

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

puts largest_prime_factor 600851475143