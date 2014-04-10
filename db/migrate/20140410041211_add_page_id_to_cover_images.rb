class AddPageIdToCoverImages < ActiveRecord::Migration
  def change
    add_reference :cover_images, :page, index: true
  end
end
