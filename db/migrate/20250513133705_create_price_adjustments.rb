class CreatePriceAdjustments < ActiveRecord::Migration[8.0]
  def change
    create_table :price_adjustments do |t|
      t.references :first_option, foreign_key: { to_table: :options }
      t.references :second_option, foreign_key: { to_table: :options }
      t.decimal :price

      t.index [:first_option_id, :second_option_id], unique: true

      t.timestamps
    end
  end
end
