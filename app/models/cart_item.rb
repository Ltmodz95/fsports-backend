class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  def total_price
    selected_options.present? ? PriceCalculator.new(JSON.parse(selected_options).map(&:first), product.id).calculate_price[0] : product.base_price
  end
end
