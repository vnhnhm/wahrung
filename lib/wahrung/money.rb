require 'byebug'

# rubocop:disable Style/Documentation
class Money
  attr_accessor :amount, :currency

  class << self
    attr_accessor :configuration
  end

  # rubocop:disable Lint/DuplicateMethods
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end

  def self.reset
    @configuration = Configuration.new
  end

  def initialize(amount, currency = Money.configuration.default_currency)
    @amount   = amount
    @currency = currency
  end

  def inspect
    formatted_result
  end

  def convert_to(currency)
    @amount   = format_result((@amount * conversion(currency)).to_f)
    @currency = currency
    self
  end

  private

  def equalized_currency(other)
    different_currencies(other) ? equalize_currencies(other) : other.amount
  end

  def equalize_currencies(other)
    other.amount * conversion
  end

  def different_currencies(other)
    other.currency != @currency
  end

  def format_result(amount)
    format '%.2f', amount
  end

  def formatted_result(amount = @amount, currency = @currency)
    "#{format_result amount} #{currency}"
  end

  def conversion(currency = @currency)
    Money.configuration.conversions[currency]
  end
end
