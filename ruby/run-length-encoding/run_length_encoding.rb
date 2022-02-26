class RunLengthEncoding
  def self.encode data
    tmp_d = data.dup
    data_length = tmp_d.length
    result = ""
    limit, cnt, pos = 0, 0, 0
    while limit < data_length do
      pos = 0
      checker = tmp_d[pos]
      count = tmp_d.chars.take_while{|letter| letter == checker}.count
      result += count > 1 ? "#{count}#{checker}" : "#{checker}"
      limit += count
      tmp_d.slice!(0..count-1)
    end
    result
  end

  def self.decode data
    tmp_d = data.dup
    result = ""
    while tmp_d.length > 0 do
      num = tmp_d.slice!(/\d*/)
      result += num.length > 0 ? tmp_d.slice!(0) * num.to_i : tmp_d.slice!(0)
    end
    result
  end
end
