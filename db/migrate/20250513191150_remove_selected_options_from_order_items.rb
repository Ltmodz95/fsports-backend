class RemoveSelectedOptionsFromOrderItems < ActiveRecord::Migration[8.0]
  def change
    remove_column :order_items, :selected_options, :jsonb
  end
end
