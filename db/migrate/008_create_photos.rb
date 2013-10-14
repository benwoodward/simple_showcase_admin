class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :simple_showcase_admin_photos do |t|
      t.string :image

      t.timestamps
    end
  end
end
