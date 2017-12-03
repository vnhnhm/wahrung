# Comparison operations belonging to Money >, <, ==.
class Money
  def ==(other)
    @currency == other.currency && @amount == other.amount
  end

  def <(other)
    @amount < other.amount
  end

  def >(other)
    @amount > other.amount
  end
end
