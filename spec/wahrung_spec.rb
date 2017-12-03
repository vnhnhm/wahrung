# rubocop:disable Metrics/BlockLength
RSpec.describe Wahrung do
  let(:fifty_euros)    { Money.new 50, 'EUR' }
  let(:twenty_dollars) { Money.new 20, 'USD' }

  it 'has a version number' do
    expect(Wahrung::VERSION).not_to be nil
  end

  describe '#configure' do
    after { Money.reset }

    describe '@default_currency' do
      before { Money.configure { |config| config.default_currency = 'PLN' } }

      context 'when no currency is passed on creating' do
        let(:one_zloty) { Money.new 1 }
        it { expect(one_zloty.amount).to   eq 1 }
        it { expect(one_zloty.currency).to eq 'PLN' }
      end

      context 'when a currency is passed on creating' do
        let(:one_euro) { Money.new 1, 'EUR' }
        it { expect(one_euro.amount).to   eq 1 }
        it { expect(one_euro.currency).to eq 'EUR' }
      end
    end

    describe '@conversions' do
      before do
        Money.configure do |config|
          config.conversions = { 'ETHEREUM' => 0.0021594 }
        end
      end

      it 'is able to convert to a new currency' do
        one_dollar = Money.new 100, 'USD'
        expect(one_dollar.convert_to('ETHEREUM').amount).to   eq '0.22'
        expect(one_dollar.convert_to('ETHEREUM').currency).to eq 'ETHEREUM'
      end
    end
  end

  describe '#inspect' do
    it 'returns amount with two decimals and currency' do
      expect(fifty_euros.inspect).to    eq '50.00 EUR'
      expect(twenty_dollars.inspect).to eq '20.00 USD'
    end
  end

  describe '#convert_to' do
    it 'returns an instance, not a string' do
      expect(fifty_euros.convert_to('USD')).to    be_an_instance_of Money
      expect(twenty_dollars.convert_to('EUR')).to be_an_instance_of Money
    end
    it 'updates the amount and currency to their conversion' do
      expect(fifty_euros.convert_to('USD').amount).to      eq '55.50'
      expect(fifty_euros.convert_to('USD').currency).to    eq 'USD'
      expect(twenty_dollars.convert_to('EUR').amount).to   eq '16.80'
      expect(twenty_dollars.convert_to('EUR').currency).to eq 'EUR'
    end
  end
end
