module BookKeeping
  VERSION = 3
end

class Raindrops
  DIVISIBLES = [[3, "Pling"], [5, "Plang"], [7, "Plong"]]
  
  def self.convert(num)
    result = DIVISIBLES.map{|val| num % val[0] == 0 ? val[1] : false } - [nil, false]
    result.length > 0 ? result.join("") : num.to_s
  end
end
