class Phrase
  def initialize(phrase)
    @phrase = phrase.downcase.split(/'*[^\w']'*/).reject(&:empty?)
  end
  
  def word_count
    result = {}
    @phrase.map do |word|
      result[word] = @phrase.select { |split_word| split_word == word }.count
    end
    result
  end
end