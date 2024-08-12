# frozen_string_literal: true

module Helpers
  # The ItemsHelper class is used to return predefined inputs and organize code
  class ItemsHelper
    def self.prompt_user
      items = []
      loop do
        puts "Enter item in the format '<quantity> <name> at <price>' (type 'done' to finish):"
        input = gets.chomp
        break if input.downcase == "done"
        items << parse_item(input)
      end
      items
    end

    def self.parse_item(line)
      line = line.chomp
      data = line.match(/^(\d+) (.+) at (\d+\.\d{2})$/)
      if data
        quantity = data[1].to_i
        name = data[2]
        price = data[3].to_f

        imported = name.include?("imported")
        exempt = exempts.any? { |word| name.include?(word) }

        Item.new(name, price, quantity, imported: imported, exempt: exempt)
      else
        raise "Not in a valid format: #{line}"
      end
    end

    def self.exempts
      ["book", "chocolate", "pills"]
    end

    def self.example_items
      [
        [
          Item.new("book", 12.49, 2, exempt: true),
          Item.new("music CD", 14.99, 1),
          Item.new("chocolate bar", 0.85, 1, exempt: true)
        ],
        [
          Item.new("imported box of chocolates", 10.00, 1, imported: true, exempt: true),
          Item.new("imported bottle of perfume", 47.50, 1, imported: true)
        ],
        [
          Item.new("imported bottle of perfume", 27.99, 1, imported: true),
          Item.new("bottle of perfume", 18.99, 1),
          Item.new("packet of headache pills", 9.75, 1, exempt: true),
          Item.new("imported box of chocolates", 11.25, 3, imported: true, exempt: true)
        ]
      ]
    end
  end
end
