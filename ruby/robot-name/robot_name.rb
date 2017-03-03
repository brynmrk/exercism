class Robot
  @@used_name ||= []
  LETTER_RANGE = ("A".."Z").to_a
  NUMBER_RANGE = (0..9).to_a
  
  def initialize
    @name = "#{letter_generator}#{number_generator}"
    initialize if @@used_name.include?(@name)
    @@used_name << @name
  end
  
  def name
    @name
  end
  
  def reset
    initialize
  end
  
  def number_generator
    number_returned = []
    3.times{ number_returned.push( NUMBER_RANGE[rand(NUMBER_RANGE.count)] ) }
    number_returned.join('')
  end
  
  def letter_generator
    letter_returned = []
    2.times{ letter_returned.push( LETTER_RANGE[rand(LETTER_RANGE.count)] ) }
    letter_returned.join('')
  end
end
