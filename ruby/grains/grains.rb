class Grains
  def self.square num
    raise ArgumentError.new("Must specify a square between 1 and 64") if num < 1 || num > 64
    2 ** (num -1)
  end
  
  def self.total
    (1..64).reduce {|sum, n| sum += square(n) }
  end
end