class AddSlugToItems < ActiveRecord::Migration
  def change
    add_column :simple_showcase_admin_items, :slug, :string
    add_index :simple_showcase_admin_items, :slug
  end
end
