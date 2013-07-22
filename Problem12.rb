#Initial attempted solution
def divisor_num num
	divisors = 0
	i = 1
	while i <= num
		divisors += 1 if num % i == 0
		i += 1
	end
	divisors
end

puts divisor_num(28)

def next_triangle_num num
	alt = num
	i = 0
	until alt == 0
		i += 1
		alt -= i
	end
	num + 1 + i
end

puts next_triangle_num(6)

num = 28

until divisor_num(num) > 500
	num = next_triangle_num(num)
end
puts num