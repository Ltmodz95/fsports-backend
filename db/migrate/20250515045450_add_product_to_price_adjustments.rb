class AddProductToPriceAdjustments < ActiveRecord::Migration[8.0]
  def change
    add_reference :price_adjustments, :product, null: false, foreign_key: true
  end
end
