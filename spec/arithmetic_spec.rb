# rubocop:disable Metrics/BlockLength
RSpec.describe 'Money arithmetic operands' do
  let(:fifty_euros)    { Money.new 50, 'EUR' }
  let(:twenty_dollars) { Money.new 20, 'USD' }

  describe '#+' do
    context 'with different currencies' do
      it 'converts second addend and sums both numbers' do
        expect(fifty_euros + twenty_dollars).to eq '66.80 EUR'
        expect(twenty_dollars + fifty_euros).to eq '75.50 USD'
      end
    end
    context 'with equal currencies' do
      it { expect(fifty_euros + fifty_euros).to       eq '100.00 EUR' }
      it { expect(twenty_dollars + twenty_dollars).to eq '40.00 USD' }
    end
  end

  describe '#-' do
    context 'with different currencies' do
      it 'converts subtrahend and substracts both numbers' do
        expect(fifty_euros - twenty_dollars).to eq '33.20 EUR'
        expect(twenty_dollars - fifty_euros).to eq '-35.50 USD'
      end
    end
    context 'with equal currencies' do
      it { expect(fifty_euros - fifty_euros).to       eq '0.00 EUR' }
      it { expect(twenty_dollars - twenty_dollars).to eq '0.00 USD' }
    end
  end

  describe '#/' do
    context 'when dividing by a number different than zero' do
      it { expect(fifty_euros / 2).to    eq '25.00 EUR' }
      it { expect(twenty_dollars / 2).to eq '10.00 USD' }
    end
    context 'when dividing by zero' do
      it { expect(fifty_euros / 0).to    eq '0 EUR' }
      it { expect(twenty_dollars / 0).to eq '0 USD' }
    end
  end

  describe '#*' do
    it { expect(fifty_euros * 3).to    eq '150.00 EUR' }
    it { expect(twenty_dollars * 3).to eq '60.00 USD' }
  end
end
