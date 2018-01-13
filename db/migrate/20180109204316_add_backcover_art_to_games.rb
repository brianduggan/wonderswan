class AddBackcoverArtToGames < ActiveRecord::Migration
  def change
    add_column :games, :back_url, :string
  end
end
