def divisor_num num
	divisors = 0
	i = 1
	while i <= num
		divisors += 1 if num % i == 0
		i += 1
	end
	divisors
end

num = 0
i = 1
until divisor_num(num) > 500
	num += i
	i += 1
end
puts num