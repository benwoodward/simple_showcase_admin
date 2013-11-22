class CreateSimpleShowcaseAdminPages < ActiveRecord::Migration
  def change
    create_table :simple_showcase_admin_pages do |t|
      t.text :text
      t.string :title
      t.string :slug
      t.integer :row_order

      t.timestamps
    end
    add_index :simple_showcase_admin_pages, :slug
  end
end
