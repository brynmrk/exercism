require 'pry'

class Bob
  def self.hey(remark)
    result = if remark.gsub(" ", '').length < 1
      "Fine. Be that way!"
    elsif remark == remark.upcase
      "Whoa, chill out!"
    elsif remark[-1] == "?"
      "Sure."
    else
      "Whatever."
    end
    result
  end
end