module ApplicationHelper
  # For uniformity throughout the app; a helper method to format the price could be useful
  # This method will convert numeric values to a formatted string with a dollar sign
  def formatted_price(price)
    number_to_currency(price, unit: "$", precision: 2)
  end

end
