class Hamming
  def self.compute(first_strand, second_strand)
    count = 0
    raise ArgumentError unless first_strand.length == second_strand.length
    return (0..first_strand.length).count { |index| first_strand[index] != second_strand[index] }
  end
end