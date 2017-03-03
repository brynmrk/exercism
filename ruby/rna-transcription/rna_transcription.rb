module BookKeeping
  VERSION = 4
end

class Complement
  def self.of_dna(dna)
    unless dna.match(/x/i) 
      dna.split('').map do |val|
        case val
        when "C"
          "G"
        when "G"
          "C"
        when "T"
          "A"
        when "A"
          "U"
        else
          ""
        end
      end
    end.join('')
  end
end
