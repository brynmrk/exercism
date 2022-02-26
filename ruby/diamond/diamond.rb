class Diamond
  ALPHABET = ('A'..'Z').to_a.freeze

  def self.make_diamond(letter)
    idx = ALPHABET.find_index(letter.upcase)
    return "#{letter}\n" if letter == 'A'

    result = []
    ('A'..letter).map.with_index do |ltr, indx|
      if ltr == 'A'
        result << "#{' ' * (idx - indx)}#{ltr}#{' ' * (idx - indx)}\n"
      else
        space = ALPHABET.find_index(ltr) * 2 - 1
        result << "#{' ' * (idx - indx)}#{ltr}#{' ' * space}#{ltr}#{' ' * (idx - indx)}\n"
      end
    end

    [result.join, result.reverse[1..-1].join].flatten.join
  end
end
