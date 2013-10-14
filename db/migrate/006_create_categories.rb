class CreateCategories < ActiveRecord::Migration
  def change
    create_table :simple_showcase_admin_categories do |t|
      t.string :category

      t.timestamps
    end
  end
end
