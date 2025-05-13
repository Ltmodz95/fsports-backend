class CreateOrderitemOptions < ActiveRecord::Migration[8.0]
  def change
    create_table :orderitem_options do |t|
      t.references :order_item, null: false, foreign_key: true
      t.references :option, null: false, foreign_key: true

      t.timestamps
    end
  end
end
