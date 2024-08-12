RSpec.describe Receipt do
  let(:item1) { Item.new('book', 12.49, 2, exempt: true) }
  let(:item2) { Item.new('music CD', 14.99, 1) }
  let(:item3) { Item.new('chocolate bar', 0.85, 1, exempt: true) }
  let(:items) { [item1, item2, item3] }
  let(:receipt) { described_class.new(items) }

  describe '#total_taxes' do
    it 'calculates total taxes' do
      expect(receipt.total_taxes).to be_within(0.01).of(1.50)
    end
  end

  describe '#total' do
    it 'calculates total amount including taxes' do
      expect(receipt.total).to be_within(0.01).of(42.32)
    end
  end

  describe '#print_item' do
    it 'prints item details' do
      allow(receipt).to receive(:puts)

      receipt.print_item(item1)

      expect(receipt).to have_received(:puts).with("2 book: 24.98")
    end
  end

  describe '#print' do
    it 'prints all items with total taxes and total amount' do
      allow(receipt).to receive(:puts)

      receipt.print

      expect(receipt).to have_received(:puts).with("2 book: 24.98")
      expect(receipt).to have_received(:puts).with("1 music CD: 16.49")
      expect(receipt).to have_received(:puts).with("1 chocolate bar: 0.85")
      expect(receipt).to have_received(:puts).with("Sales Taxes: 1.50")
      expect(receipt).to have_received(:puts).with("Total: 42.32")
    end
  end
end
