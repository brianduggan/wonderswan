class Collection < ActiveRecord::Base
  belongs_to :user
  has_many :game_assignments, dependent: :destroy
  has_many :games, through: :game_assignments
end
