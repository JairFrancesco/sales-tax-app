RSpec.describe Helpers::ItemsHelper do
  describe 'parse_item' do
    it 'parses a valid item' do
      input = '5 book at 10.49'
      item = Helpers::ItemsHelper.parse_item(input)

      expect(item.name).to eq('book')
      expect(item.price).to eq(10.49)
      expect(item.quantity).to eq(5)
      expect(item.imported).to be false
      expect(item.exempt).to be true
    end

    it 'parses an imported item correctly' do
      input = '3 imported bottle of wine at 37.50'
      item = Helpers::ItemsHelper.parse_item(input)

      expect(item.name).to eq('imported bottle of wine')
      expect(item.price).to eq(37.50)
      expect(item.quantity).to eq(3)
      expect(item.imported).to be true
      expect(item.exempt).to be false
    end

    it 'raises an error for invalid format' do
      invalid_input = 'invalid input'
      
      expect { Helpers::ItemsHelper.parse_item(invalid_input) }.to raise_error("Not in a valid format: #{invalid_input}")
    end
  end

  describe 'exempts' do
    it 'returns the list of exempts' do
      expect(Helpers::ItemsHelper.exempts).to eq(['book', 'chocolate', 'pills'])
    end
  end

  describe 'example_items' do
    it 'returns predefined example items' do
      expect(Helpers::ItemsHelper.example_items.count).to be_positive
    end
  end
end