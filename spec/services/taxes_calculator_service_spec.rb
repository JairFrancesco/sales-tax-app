RSpec.describe Services::TaxesCalculatorService do
  describe '#call' do
    it 'calculates tax for a non-exempt, non-imported item' do
      item = Item.new('Testing item', 200.00, 1, imported: false, exempt: false)
      service = described_class.new(item)
      tax = service.call

      expect(tax).to eq(20.00)
    end

    it 'calculates tax for an exempt, non-imported item' do
      item = Item.new('Exempt', 200.00, 1, imported: false, exempt: true)
      service = described_class.new(item)
      tax = service.call

      expect(tax).to eq(0.00)
    end

    it 'calculates tax for a non-exempt, imported item' do
      item = Item.new('Imported', 200.00, 1, imported: true, exempt: false)
      service = described_class.new(item)
      tax = service.call

      expect(tax).to eq(30.00)
    end

    it 'calculates tax for an exempt, imported item' do
      item = Item.new('Imported Exempt', 200.00, 1, imported: true, exempt: true)
      service = described_class.new(item)
      tax = service.call

      expect(tax).to eq(10.00)
    end
  end

  describe '#round_up_tax' do
    it 'rounds tax up to the nearest 0.05' do
      item = Item.new('test', 0.00, 1)
      service = described_class.new(item)

      expect(service.send(:round_up_tax, 0.03)).to be_within(0.01).of(0.05)
      expect(service.send(:round_up_tax, 0.07)).to be_within(0.01).of(0.10)
      expect(service.send(:round_up_tax, 1.12)).to be_within(0.01).of(1.15)
    end
  end
end
