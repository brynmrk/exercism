module BookKeeping
  VERSION = 1
end

class Sieve
  def initialize(num)
    @num = num
  end
  
  def primes
    list_of_primes = []
    (2..@num).each do |num|
        list_of_primes.any? { |l| num % l == 0 } ? nil : list_of_primes.push(num)
      end
    list_of_primes.length > 0 ? list_of_primes : []
  end
end
