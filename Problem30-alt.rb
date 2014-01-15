#Takes 3 seconds longer than subset method
def is_digit_fifth_power?(num, arr)
  arr.inject(0) { |accum, el| accum += el ** 5 } == num
end

sum = 0
(32..999999).each do |i|
  i_arr = i.to_s.split('').map(&:to_i)
  sum += i if is_digit_fifth_power?(i, i_arr)
end

p sum