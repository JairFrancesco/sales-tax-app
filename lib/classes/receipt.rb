# frozen_string_literal: true

# The Receipt class is used to encapsulate details and behaviors associated with a Receipt in the app
class Receipt
  attr_reader :items

  def initialize(items)
    @items = items
    @calculator_service = Services::TaxesCalculatorService
  end

  def total_taxes
    items.sum { |item| @calculator_service.call(item) * item.quantity }
  end

  def total
    items.sum { |item| (item.price + @calculator_service.call(item)) * item.quantity }
  end

  def print_item(item)
    price_with_tax = item.price + @calculator_service.call(item)
    puts "#{item.quantity} #{item.name}: #{format("%.2f", (price_with_tax * item.quantity))}"
  end

  def print
    items.each do |item|
      print_item(item)
    end
    puts "Sales Taxes: #{format("%.2f", total_taxes)}"
    puts "Total: #{format("%.2f", total)}"
  end
end
