class AddIndexToBlogs < ActiveRecord::Migration
  def change
    add_reference :blogs, :user, index: true
  end
end
