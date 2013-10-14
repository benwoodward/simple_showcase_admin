class AddSlugToUsers < ActiveRecord::Migration
  def change
    add_column :simple_showcase_admin_users, :slug, :string
    add_index :simple_showcase_admin_users, :slug

  end
end
