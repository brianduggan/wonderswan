class Game < ActiveRecord::Base

  has_many :game_assignments, dependent: :destroy
  has_many :collections, through: :game_assignments

 acts_as_taggable_on :genres
end
