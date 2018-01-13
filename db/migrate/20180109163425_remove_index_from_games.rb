class RemoveIndexFromGames < ActiveRecord::Migration
  def change
    remove_reference :games, :collections
  end
end
