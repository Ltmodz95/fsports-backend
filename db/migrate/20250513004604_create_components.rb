class CreateComponents < ActiveRecord::Migration[8.0]
  def change
    create_table :components do |t|
      t.string :name
      t.belongs_to :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
