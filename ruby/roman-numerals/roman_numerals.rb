module BookKeeping
  VERSION = 2
end

class Fixnum
  def to_roman
    # Possible combinations in roman numeral
    roman_converter = [["I", 1], ["IV", 4], ["V", 5], ["IX", 9], ["X", 10], ["XL", 40], \
                      ["L", 50], ["XC", 90], ["C", 100], ["CD", 400], ["D", 500], \
                      ["CM", 900], ["M", 1_000]].reverse
    number = self
    roman_number = []
    roman_converter.each do |value|
      while number-value[1] >= 0
        number = number - value[1]
        roman_number.push(value[0])
      end
    end
    

    roman_number.join('')
  end
end
