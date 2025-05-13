class CreateIncompatablityRules < ActiveRecord::Migration[8.0]
  def change
    create_table :incompatablity_rules do |t|
      t.integer :first_option_id
      t.integer :second_option_id

      t.timestamps
    end
  end
end
