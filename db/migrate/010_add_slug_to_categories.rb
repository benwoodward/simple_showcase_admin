class AddSlugToCategories < ActiveRecord::Migration
  def change
    add_column :simple_showcase_admin_categories, :slug, :string
    add_index :simple_showcase_admin_categories, :slug

  end
end
