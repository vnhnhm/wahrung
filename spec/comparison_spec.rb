RSpec.describe 'Money comparison operands' do
  let(:fifty_euros)    { Money.new 50, 'EUR' }
  let(:twenty_dollars) { Money.new 20, 'USD' }

  describe '#==' do
    let(:fifty_eur_in_usd) { fifty_euros.dup.convert_to 'USD' }
    it { expect(twenty_dollars == Money.new(20, 'USD')).to be true }
    it { expect(twenty_dollars == Money.new(30, 'USD')).to be false }
    it { expect(fifty_eur_in_usd == fifty_euros).to        be false }
    it { expect(fifty_eur_in_usd == fifty_euros.convert_to('USD')).to be true }
  end

  describe '#<' do
    it { expect(twenty_dollars < Money.new(21, 'USD')).to be true }
    it { expect(twenty_dollars < Money.new(0, 'USD')).to  be false }
    it { expect(fifty_euros < twenty_dollars).to          be false }
  end

  describe '#>' do
    it { expect(twenty_dollars > Money.new(19, 'USD')).to be true }
    it { expect(twenty_dollars > Money.new(21, 'USD')).to be false }
    it { expect(twenty_dollars > fifty_euros).to          be false }
  end
end
