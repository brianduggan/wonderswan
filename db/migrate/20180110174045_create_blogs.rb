class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :author
      t.string :title
      t.string :body
      t.boolean :published
      t.boolean :active
      t.timestamps null: false
    end
  end
end
