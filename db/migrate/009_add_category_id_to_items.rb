class AddCategoryIdToItems < ActiveRecord::Migration
  def change
    add_column :simple_showcase_admin_items, :category_id, :integer

  end
end
