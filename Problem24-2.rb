#Attempted brute force solution using a shortcut from the corresponding
#alt file.
def next_lexicographic_permutation num_str
	nums = num_str.to_s.chars.sort.join
	nums = nums.to_i.to_s if (nums[0] == '0' && nums.to_i.to_s.reverse.to_i > num_str.to_i)
	new_nums = ''
	result = num_str.to_i
	until new_nums == nums
		result += 1
		new_nums = result.to_s.chars.sort.join
	end
	result.to_s
end

def factorial n
	i = n - 1
	result = n
	until i == 1
		result *= i
		i -= 1
	end
	result
end

num_str = '2013456789'
puts next_lexicographic_permutation(num_str)
(1000000 - (factorial(9) * 2)).times do |i| 
	num_str = next_lexicographic_permutation(num_str)
	puts num_str
end
puts num_str