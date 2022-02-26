class PhoneNumber
  def self.clean(unsanitized_phone_number)
    return nil unless [10, 11].include? unsanitized_phone_number.scan(/\d/).size

    unsanitized_phone_number.gsub!(/\D/, '')
    if unsanitized_phone_number.chars.size == 11 && unsanitized_phone_number.chars[0].to_i == 1
      unsanitized_phone_number = unsanitized_phone_number.chars[1..-1].join
    elsif unsanitized_phone_number.chars.size == 11 && unsanitized_phone_number.chars[0].to_i != 1
      return nil
    end

    return nil if unsanitized_phone_number.chars[0].to_i < 2 || unsanitized_phone_number.chars[3].to_i < 2

    unsanitized_phone_number
  end
end
