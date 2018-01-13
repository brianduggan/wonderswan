class GameAssignment < ActiveRecord::Base
  belongs_to :collection
  belongs_to :game
end
