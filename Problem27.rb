def is_prime?(num)
  (2..Math.sqrt(num)).each do |factor|
    return false if num % factor == 0
  end
  true
end

def num_primes_output(&prc)
  100.times do |input|
    result = prc.call(input)
    return (input-1) unless result > 0 && is_prime?(result)
  end
end

def gcd(a, b)
  a,b = b,a if a < b
  a, b = b, a % b while b > 0
  a
end

start_time = Time.now
best_num_primes, best_a, best_b = 41,0,0

(-1000..1000).each do |a|
  (-1000..1000).each do |b|
    next if gcd(a,b) < best_num_primes
    curr_num_primes = num_primes_output { |n| (n ** 2) + (a * n) + b }
    if curr_num_primes > best_num_primes
      best_a, best_b = a, b
      best_num_primes = curr_num_primes
    end
  end
end

p best_a * best_b
p Time.now - start_time