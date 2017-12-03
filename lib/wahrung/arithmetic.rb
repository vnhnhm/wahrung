# Arithmetical operations belonging to Money +, -, /, *.
class Money
  def +(other)
    formatted_result @amount + equalized_currency(other)
  end

  def -(other)
    formatted_result @amount - equalized_currency(other)
  end

  def /(other)
    return "0 #{@currency}" if other.zero?
    formatted_result @amount / other
  end

  def *(other)
    formatted_result @amount * other
  end
end
