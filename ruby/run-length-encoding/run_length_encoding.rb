class RunLengthEncoding
  def self.encode data
    data_length = data.length
    result = ""
    limit, cnt, pos = 0, 0, 0
    while limit < data_length do
      pos = 0
      checker = data[pos]
      count = data.chars.take_while{|letter| letter == checker}.count
      result += count > 1 ? "#{count}#{checker}" : "#{checker}"
      limit += count
      data.slice!(0..count-1)
    end
    result
  end
  
  def self.decode data
    result = ""
    while data.length > 0 do
      num = data.slice!(/\d*/)
      result += num.length > 0 ? data.slice!(0) * num.to_i : data.slice!(0)
    end
    result
  end
end