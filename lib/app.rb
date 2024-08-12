require_relative "load_paths"

puts "Choose an option:"
puts "1. Enter items manually"
puts "2. Use testing inputs"
puts "3. Load items from file"
choice = gets.chomp.to_i

case choice
when 1
  items = Helpers::ItemsHelper.prompt_user
  receipt = Receipt.new(items)
  receipt.print
when 2
  example_items = Helpers::ItemsHelper.example_items
  example_items.each_with_index do |items, index|
    puts "Output #{index + 1}:"
    receipt = Receipt.new(items)
    receipt.print
  end
when 3
  puts "Enter the filename (e.g., 'input1.txt'):"
  filename = gets.chomp
  complete_path = File.join(__dir__, "inputs", filename)
  if File.exist?(complete_path)
    items = Services::ItemsReaderService.call(complete_path)
    receipt = Receipt.new(items)
    receipt.print
  else
    puts "File not found: #{complete_path}"
    return
  end
else
  puts "Invalid option"
end
