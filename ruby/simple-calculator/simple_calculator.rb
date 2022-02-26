class SimpleCalculator
  class UnsupportedOperation < Exception; end

  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  def self.calculate(first_operand, second_operand, operation)
    raise UnsupportedOperation unless ALLOWED_OPERATIONS.include?(operation)
    raise ArgumentError if first_operand.class == String || second_operand.class == String
    return "Division by zero is not allowed." if second_operand == 0 && operation == '/'

    result = nil
    case operation
    when '+'
      result = first_operand + second_operand
    when '/'
      result = first_operand / second_operand
    when '*'
      result = first_operand * second_operand
    else
    end

    return "#{first_operand} #{operation} #{second_operand} = #{result}"
  end
end
