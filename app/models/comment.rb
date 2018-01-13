class Comment < ActiveRecord::Base
  belongs_to :blogs
  belongs_to :users
end
