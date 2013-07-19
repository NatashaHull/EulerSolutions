class Fixnum
  def is_prime?
    2.upto(Math.sqrt self) do |x|
      if self % x == 0
        return false
      end
    end
    true
  end
  
  def prime_factors
    factors = []
    remainder = self
    x = 2
    while x <= remainder
      if x.is_prime?
        while remainder % x == 0
          remainder /= x
          factors << x
        end
      end
      x += 1
    end
    factors
  end
end

p 6008514751.prime_factors