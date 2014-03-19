class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :content
      t.integer :author_id

      t.timestamps
    end
  end
end
