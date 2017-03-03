module BookKeeping
  VERSION = 3
end

class Squares
  def initialize(num)
    @num = num
  end
  
  def square_of_sum
    (1..@num).map{|val| val }.inject(:+)**2
  end
  
  def sum_of_squares
    (1..@num).map{|val| val**2 }.inject(:+)
  end
  
  def difference
    @num > 0 ? (square_of_sum) - (sum_of_squares) : 0
  end
end
