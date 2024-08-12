
RSpec.describe Item do
  describe '#initialize' do
    it 'correctly initializes without errors' do
      item = Item.new('book', 12.49, 2, imported: true, exempt: true)

      expect(item.name).to eq('book')
      expect(item.price).to eq(12.49)
      expect(item.quantity).to eq(2)
      expect(item.imported).to be true
      expect(item.exempt).to be true
    end
  end

  describe '#total' do
    it 'calculates the total price correctly' do
      item = Item.new('book', 12.49, 2)

      expect(item.total).to eq(24.98)
    end

    it 'calculates the total price as zero if quantity is zero' do
      item = Item.new('book', 12.49, 0)

      expect(item.total).to eq(0.00)
    end
  end
end
