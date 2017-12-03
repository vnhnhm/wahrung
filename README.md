# Währung

Handles different currency conversions, arithmetic operations and stuff.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wahrung'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wahrung

## Usage

Instantiating an object:

```ruby
fifty_eur = Money.new 50, 'EUR'
```

Get amount and currency:

```ruby
fifty_eur.amount   # 50
fifty_eur.currency # "EUR"
fifty_eur.inspect  # "50.00 EUR"
```

Convert to other currency (returns an instance, not a string):

```ruby
fifty_eur.convert_to 'USD'        # => 55.50 USD
fifty_eur.convert_to('USD').class # => Money
```

Arithmetic operations:

```ruby
twenty_dollars = Money.new 20, 'USD'
fifty_eur      = Money.new 50, 'EUR'
fifty_eur + twenty_dollars # => 68.02 EUR
fifty_eur - twenty_dollars # => 31.98 EUR
fifty_eur / 2              # => 25 EUR
twenty_dollars * 3         # => 60 USD
```

Comparisons:

```ruby
twenty_dollars == Money.new(20, 'USD') # => true
twenty_dollars == Money.new(30, 'USD') # => false

fifty_eur_in_usd = fifty_eur.convert_to 'USD'
fifty_eur_in_usd == fifty_eur # => true

twenty_dollars > Money.new(5, 'USD') # => true
twenty_dollars < fifty_eur           # => true
```

You can set a default currency and handle the conversions within the configure method:

```ruby
Money.configure do |config|
  config.default_currency = 'EUR'
  config.conversions = {
    'USD'     => 1.11,
    'Bitcoin' => 0.0047
  }
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/vnhnhm/wahrung. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Wahrung project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/vnhnhm/wahrung/blob/master/CODE_OF_CONDUCT.md).
