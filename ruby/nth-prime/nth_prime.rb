class Prime
  def self.nth(pos)
    primes = []
    raise ArgumentError if pos < 1
    (2..pos**2+1).each do |num|
      break if primes.count >= pos
      primes.push(num) if (2..num - 1).all? { |dividenum| num % dividenum > 0 }
    end
    primes.last
  end
end