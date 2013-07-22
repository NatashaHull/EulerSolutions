#Failed indirect attempt
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

def is_square? num
	result = false
	i = 1
	while i <= num
		result = true if (i * i) == num
		i += 1
	end
	result
end

primes_to_twenty = []
nums = []
x = 2
while x <= 20
	nums << x
	primes_to_twenty << x if is_prime?(x) || is_square?(x)
	x += 1
end
smallest_product = primes_to_twenty.inject(:*)
puts smallest_product

nums.each do |num|
	puts num
	until (smallest_product % num == 0)
		smallest_product *= num
	end
	puts smallest_product
end

puts smallest_product