class Crypto
  def initialize(plain_text)
    @plain_text = plain_text.downcase.gsub(/[^a-z0-9]/, "")
  end

  def ciphertext
    array = []
    square = Math.sqrt(@plain_text.length).ceil
    @plain_text += " " if @plain_text.length > 0 && @plain_text.length % square != 0

    square.times do |row|
      index = row
      text = ""

      square.times do
        text += @plain_text[index] || ""
        index = index + square
      end

      array << text
    end

    array[-1] += " " if array.length > 0 && array[-1].length < square
    array.join(" ")
  end
end
