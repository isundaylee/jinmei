class CreateCoverImages < ActiveRecord::Migration
  def change
    create_table :cover_images do |t|
      t.string :image

      t.timestamps
    end
  end
end
