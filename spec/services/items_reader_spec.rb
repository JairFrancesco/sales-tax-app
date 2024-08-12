RSpec.describe Services::ItemsReaderService do
  let(:file_name) { 'spec/fixtures/input.txt' }
  let(:service) { described_class.new(file_name) }

  before do
    File.open(file_name, 'w') do |f|
      f.write("2 book at 12.49\n1 music CD at 14.99\n1 chocolate bar at 0.85")
    end
  end

  after do
    File.delete(file_name) if File.exist?(file_name)
  end

  describe '#call' do
    it 'reads items from a file and parses them' do
      items = service.call

      expect(items.count).to eq(3)
      expect(items[0].name).to eq('book')
      expect(items[0].price).to eq(12.49)
      expect(items[0].quantity).to eq(2)
      expect(items[1].name).to eq('music CD')
      expect(items[1].price).to eq(14.99)
      expect(items[1].quantity).to eq(1)
      expect(items[2].name).to eq('chocolate bar')
      expect(items[2].price).to eq(0.85)
      expect(items[2].quantity).to eq(1)
    end
  end
end
