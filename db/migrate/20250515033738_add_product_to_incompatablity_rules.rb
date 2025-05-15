class AddProductToIncompatablityRules < ActiveRecord::Migration[8.0]
  def change
    add_reference :incompatablity_rules, :product, null: false, foreign_key: true
  end
end
