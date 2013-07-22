#Attempt at a different (shorter) way to get a solution
def divisor_num num
	divisors = 1
	until num == 1
		arr = prime_divisors(num)
		num = arr[1]
		divisors += arr[0]
	end
	divisors
end

def prime_divisors num
	divisors = []
	i = 2
	while i <= num
		if num % i == 0
			divisors << i
			num /= i
		end
		i += 1
	end
	[divisors.length, num]
end

def next_triangle_num(num, triangle_num)
	num + 1 + triangle_num
end

num = 1
triangle_num = 1
max = 0
until divisor_num(num) > 500
	num = next_triangle_num(num, triangle_num)
	triangle_num += 1
	max = divisor_num(num) if divisor_num(num) > max
	puts max
end
puts num