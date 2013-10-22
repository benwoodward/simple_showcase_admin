class AddRowOrderToItems < ActiveRecord::Migration
  def change
    add_column :simple_showcase_admin_items, :row_order, :integer
  end
end
