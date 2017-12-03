# Arithmetical operations belonging to Money +, -, /, *.
class Money
  # Adds the amount with the given Money object's amount and
  # returns a string object with the final amount and initial currency.
  #
  # @param [Money] value Number to add by.
  #
  # @return [String] The resulting amount and currency.
  #
  # @example
  #   Money.new(10, 'USD') + Money.new(10, 'USD') # => "20.00 USD"
  #   Money.new(10, 'USD') + Money.new(10, 'EUR') # => "21.10 USD"
  def +(other)
    formatted_result @amount + equalized_currency(other)
  end

  # Substracts the amount with the given Money object's amount and
  # returns a string object with the final amount and initial currency.
  #
  # @param [Money] value Number to substract by.
  #
  # @return [String] The resulting amount and currency.
  #
  # @example
  #   Money.new(20, 'USD') - Money.new(10, 'USD') # => "10.00 USD"
  #   Money.new(20, 'EUR') - Money.new(10, 'USD') # => "11.60 EUR"
  def -(other)
    formatted_result @amount - equalized_currency(other)
  end

  # Divides the amount with the given number and string
  # object with the final amount and currency.
  #
  # In case the argument being passed is 0 (zero), returns a formatted
  # string containing 0 and the @currency. Otherwise performs the operation.
  #
  # @param [Numeric] value Number to divide by.
  # or
  # @param [0] value Number to divide by.
  #
  # @return [String] The resulting amount and currency.
  #
  # @example
  #   Money.new(20, 'USD') / 3 # => "6.00 USD"
  #   Money.new(20, 'EUR') / 0 # => "0 USD"
  def /(other)
    return "0 #{@currency}" if other.zero?
    formatted_result @amount / other
  end

  # Multiplies the amount with the given number and string
  # object with the final amount and currency.
  #
  # @param [Numeric] value Number to divide by.
  #
  # @return [String] The resulting amount and currency.
  #
  # @example
  #   Money.new(20, 'USD') * 33 # => "660.00 USD"
  def *(other)
    formatted_result @amount * other
  end
end
