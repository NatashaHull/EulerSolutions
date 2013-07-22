#Solution, but really slow
def divisor_num num
	divisors = 0
	i = 1
	while i <= num
		divisors += 1 if num % i == 0
		i += 1
	end
	puts divisors
	divisors
end

def next_triangle_num(num, triangle_num)
	num + 1 + triangle_num
end

num = 1
triangle_num = 1
until divisor_num(num) > 500
	num = next_triangle_num(num, triangle_num)
	triangle_num += 1
end
puts num