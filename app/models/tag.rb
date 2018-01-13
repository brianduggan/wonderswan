class Tag < ActiveRecord::Base
  has_many :tag_assignments
  has_many :blogs, through: :tag_assignments
end
