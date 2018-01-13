class User < ActiveRecord::Base
  has_secure_password
  has_many :collections
  has_many :blogs
  has_many :games, through: :collections
  has_many :comments
  validates :username, uniqueness: true

  def permission_level
    if self.permission == 0
      "Standard User"
    elsif self.permission == 1
      "Admin"
    else
      "Standard User"
    end
  end

end
