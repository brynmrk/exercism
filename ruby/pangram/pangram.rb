module BookKeeping
  VERSION = 4
end

class Pangram
  def self.pangram?(phrase)
    phrase.downcase
    ('a'..'z').all? { |ltr| phrase.include? (ltr) }
  end
end
