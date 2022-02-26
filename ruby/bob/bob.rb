class Bob
  def self.hey(remark)
    if remark.strip.empty?
      'Fine. Be that way!'
    elsif remark == remark.upcase && remark != remark.downcase && remark.strip.end_with?('?')
      'Calm down, I know what I\'m doing!'
    elsif remark == remark.upcase && remark != remark.downcase
      'Whoa, chill out!'
    elsif remark.strip.end_with?('?')
      'Sure.'
    else
      'Whatever.'
    end
  end
end
