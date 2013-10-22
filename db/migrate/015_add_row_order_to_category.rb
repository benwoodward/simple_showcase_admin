class AddRowOrderToCategory < ActiveRecord::Migration
  def change
    add_column :simple_showcase_admin_categories, :row_order, :integer
  end
end
