def is_amicable? num
	result = false
	divisors = divisors(num)
	sum = divisors.inject(:+)
	result = true if (divisors(sum).inject(:+) == num) && (sum != num)
	result
end

def divisors num
	divisors_array = []
	1.upto(num - 1) do |x|
		divisors_array << x if (num % x == 0)
	end
	divisors_array
end

amicable_numbers = []
i = 2
while i < 10000
	amicable_numbers << i if is_amicable?(i)
	i += 1
end

puts amicable_numbers.inject(:+)