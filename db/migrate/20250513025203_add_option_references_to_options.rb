class AddOptionReferencesToOptions < ActiveRecord::Migration[8.0]
  def change
    add_reference :options, :first_option, foreign_key: { to_table: :options }
    add_reference :options, :second_option, foreign_key: { to_table: :options }
    
    add_index :options, [:first_option_id, :second_option_id], unique: true
  end
end
