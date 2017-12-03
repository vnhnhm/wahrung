require 'spec_helper'

RSpec.describe Configuration do
  describe '#default_currency' do
    it 'has default currency UAH' do
      Configuration.new.default_currency = 'UAH'
    end
    it 'has a specific conversion' do
      Configuration.new.conversions = { 'ETHEREUM' => '0.0021594' }
    end
  end

  describe '#default_currency=' do
    it 'can set a value' do
      config = Configuration.new
      config.default_currency = 'CLP'
      expect(config.default_currency).to eq 'CLP'
    end
  end
end
