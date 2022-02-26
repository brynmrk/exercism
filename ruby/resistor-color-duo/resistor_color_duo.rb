class ResistorColorDuo
  COLORS = ["Black", "Brown", "Red", "Orange", "Yellow", "Green", "Blue", "Violet", "Grey", "White"].freeze

  def self.value(colors)
    color_band = ""

    colors.map.with_index do |clr, idx|
      break if idx >= 2

      titled_clr = clr.chars[0].upcase + clr.chars.map { |c| c.downcase }[1..-1].join
      color_band += COLORS.find_index(titled_clr).to_s
    end

    return color_band.to_i
  end
end
