class Pangram
  def self.pangram?(phrase)
    ('a'..'z').all? { |ltr| phrase.downcase.include? (ltr) }
  end
end
