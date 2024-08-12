# frozen_string_literal: true

module Services
  # The ItemsReaderService class is used to encapsulate details and behaviors associated with reading items from a txt file
  class ItemsReaderService < ApplicationService
    def initialize(file_name)
      @file_name = file_name
    end

    def call
      load_from_file(@file_name)
    end

    def load_from_file(filename)
      items = []
      File.foreach(filename) do |line|
        items << Helpers::ItemsHelper.parse_item(line)
      end
      items
    end
  end
end
