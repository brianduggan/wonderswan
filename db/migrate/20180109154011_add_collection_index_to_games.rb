class AddCollectionIndexToGames < ActiveRecord::Migration
  def change
    add_reference :games, :collections, index: true
  end
end
