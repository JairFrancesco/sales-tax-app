# frozen_string_literal: true

# The Item class is used to encapsulate details and behaviors associated with a Single item in the app
class Item
  attr_reader :name, :price, :quantity, :imported, :exempt

  def initialize(name, price, quantity, imported: false, exempt: false)
    @name = name
    @price = price
    @quantity = quantity
    @imported = imported
    @exempt = exempt
  end

  def total
    quantity * price
  end
end
