#Actual Solution
def divisor_num num
	divisors = 0
	i = 1
	while i <= Math.sqrt(num)
		divisors += 1 if num % i == 0
		i += 1
	end
	divisors * 2
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
	if divisor_num(num) > max
		max = divisor_num(num)
		puts max
	end
end
puts num