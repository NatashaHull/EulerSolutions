#While working on brute force solutions, I developed this
#solution to create shortcuts and ended up figuring out how to solve
#the problem quickly using the methods below.
def nearest_lexicographic_permuation(num)
	result = []
	while num > 0
		n = 1
		n += 1 until factorial(n) > num
		n -=1
		i = 1
		i += 1 until factorial(n) * i > num
		i -= 1
		result << [n, i]
		num -= factorial(n) * i
	end
	result
end

def generate_lexicographic_permutation(num, num_arr)
	num_locations = nearest_lexicographic_permuation(num - 1)
	result = []
	num_locations.each_with_index do |location, i|
		result[9 - location[0]] = num_arr[location[1]]
		if 9 - location[0] != i
			result[i] = num_arr[i]
			num_arr.delete_at(i)
		end
		num_arr.delete_at(location[1])
	end
	result << num_arr.join
	result.join
end

def factorial n
	i = n
	result = n
	until i == 1
		i -= 1
		result *= i
	end
	result
end

num_arr = '0123456789'.split('')
puts generate_lexicographic_permutation(1000000, num_arr)