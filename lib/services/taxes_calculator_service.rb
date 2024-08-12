# frozen_string_literal: true

module Services
  # The TaxesCalculatorService class is used to encapsulate details and behaviors associated with taxes calculation
  class TaxesCalculatorService < ApplicationService
    BASIC_SALES_TAX_RATE = 0.10
    IMPORT_DUTY_RATE = 0.05

    def initialize(item)
      @item = item
    end

    def call
      calculate_tax(@item)
    end

    def calculate_tax(item)
      tax = 0
      tax += item.price * BASIC_SALES_TAX_RATE unless item.exempt
      tax += item.price * IMPORT_DUTY_RATE if item.imported
      round_up_tax(tax)
    end

    def round_up_tax(amount)
      (amount.to_f / 0.05).ceil * 0.05 # nearest 0.05
    end
  end
end
