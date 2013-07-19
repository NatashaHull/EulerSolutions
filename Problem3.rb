def largest_prime_factor num
	factors = factors(num)
	prime_factors = primes(factors)
	prime_factors.max
end

def factors num
	factors = []
	factor = 2
	while factor <= num
		if num % factor == 0
			factors << factor
			num /= factor
		end
		factor += 1
	end
	factors << num
	factors
end

def primes arr
	primes = []
	arr.each do |num|
		primes << num if is_prime?(num)
	end
	primes
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