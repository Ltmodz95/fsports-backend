class CreateCartItems < ActiveRecord::Migration[8.0]
  def change
    create_table :cart_items do |t|
      t.belongs_to :cart, null: false, foreign_key: true
      t.belongs_to :product, null: false, foreign_key: true
      t.jsonb :selected_options

      t.timestamps
    end
  end
end
