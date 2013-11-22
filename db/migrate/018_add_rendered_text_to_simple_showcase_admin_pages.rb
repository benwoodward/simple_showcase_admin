class AddRenderedTextToSimpleShowcaseAdminPages < ActiveRecord::Migration
  def change
    add_column :simple_showcase_admin_pages, :rendered_text, :text
  end
end
