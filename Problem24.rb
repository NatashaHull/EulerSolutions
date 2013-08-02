#Initial attempted brute force solution
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

num_str = '0123456789'
puts next_lexicographic_permutation(num_str)
999999.times do |i| 
	num_str = next_lexicographic_permutation(num_str)
	puts num_str
end
puts num_str