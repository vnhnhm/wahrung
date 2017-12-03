# Comparison operations belonging to Money >, <, ==.
class Money
  # Compares the @currency and @amount to see if they match exactly in both
  # cases. If so returns true, otherwise false.
  #
  # @param [Money] value Number to compare.
  #
  # @return [Boolean] The boolean result from the comparison.
  #
  # @example
  #   Money.new(10, 'USD') == Money.new(10, 'USD') # => true
  #   Money.new(10, 'USD') == Money.new(11, 'USD') # => false
  def ==(other)
    @currency == other.currency && @amount == other.amount
  end

  # Compares the amounts to see if current is less than the one being passed.
  # If so returns true, otherwise false.
  #
  # @param [Money] value Number to compare.
  #
  # @return [Boolean] The boolean result from the comparison.
  #
  # @example
  #   Money.new(10, 'USD') < Money.new(10, 'USD') # => false
  #   Money.new(10, 'USD') < Money.new(11, 'USD') # => true
  def <(other)
    @amount < other.amount
  end

  # Compares the amounts to see if current is greather than the one being
  # passed. If so returns true, otherwise false.
  #
  # @param [Money] value Number to compare.
  #
  # @return [Boolean] The boolean result from the comparison.
  #
  # @example
  #   Money.new(10, 'USD') > Money.new(10, 'USD') # => false
  #   Money.new(11, 'USD') > Money.new(10, 'USD') # => true
  def >(other)
    @amount > other.amount
  end
end
