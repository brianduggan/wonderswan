class Collection < ActiveRecord::Base
  belongs_to :user
  has_many :game_assignments, dependent: :destroy
  has_many :games, -> { order 'games.title' }, through: :game_assignments
end
