class CreateOptions < ActiveRecord::Migration[8.0]
  def change
    create_table :options do |t|
      t.string :name
      t.decimal :price
      t.boolean :in_stock
      t.belongs_to :component, null: false, foreign_key: true

      t.timestamps
    end
  end
end
