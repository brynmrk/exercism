class Year
  def self.leap? year
    year % 4 && year % 400 == 0 || year % 100 != 0 ? true : false
  end
end