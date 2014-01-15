require 'set'
def subsets(arr)
  return Set.new([arr]) if arr.empty?
  sets = Set.new([])
  subsets(arr[1..-1]).each do |set|
    sets << set.sort
    sets << (set + [arr[0]]).sort
  end
  sets
end

def num_contains_els?(num, arr)
  while num > 0
    return false unless arr.include?(num % 10) || (num % 10 == 0)
    arr.delete_at(arr.index(num % 10)) unless num % 10 == 0
    num /= 10
  end
  arr.empty?
end

def digit_fifth_powers(arr)
  sum = arr.inject(0) { |accum, num| accum += num ** 5 }
  num_contains_els?(sum, arr) ? sum : nil
end

digit_fifth_powers_sum = 0
inital_set = (1..9).to_a * 3
sets = subsets(inital_set)
sets.each do |arr|
  next if arr.length < 2
  is_digit_power = digit_fifth_powers(arr)
  digit_fifth_powers_sum += is_digit_power if is_digit_power
end

p digit_fifth_powers_sum