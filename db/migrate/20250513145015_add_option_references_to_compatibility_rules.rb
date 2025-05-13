class AddOptionReferencesToCompatibilityRules < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :incompatablity_rules, :options, column: :first_option_id
    add_foreign_key :incompatablity_rules, :options, column: :second_option_id
    
    add_index :incompatablity_rules, [:first_option_id, :second_option_id], unique: true, name: 'index_incompatability_rules_on_options'
  end
end
