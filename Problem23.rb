def is_abundant? num
	divisors(num).inject(:+) > num
end
#Will add code later for refractoring
=begin
def is_abundant_sum?(num abundant_nums)
end
=end
def divisors num
	divisors = []
	1.upto(num-1) { |x| divisors << x if (num % x == 0) }
	divisors
end
puts is_abundant?(12)
p divisors(12)
abundant_nums = []
11.upto(28123) { |x| abundant_nums << x if is_abundant?(x) }
p abundant_nums.length
non_abundant_sums = 0
1.upto(28123) do |x|
	nums = abundant_nums.select { |y| y < x }
	non_abundant_sum = true
	if nums.length >= 2
		nums.each_with_index do |num1, i|
			nums.each_with_index do |num2, j|
				if (num1+num2 == x)
					non_abundant_sum = false
					break
				end
			end
			break if (non_abundant_sum == false) || (i+i > x)
		end
	end
	puts x if non_abundant_sum
	non_abundant_sums += x if non_abundant_sum
end
puts non_abundant_sums