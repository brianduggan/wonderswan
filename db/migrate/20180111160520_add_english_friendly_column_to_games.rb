class AddEnglishFriendlyColumnToGames < ActiveRecord::Migration
  def change
    add_column :games, :english_friendly, :string
  end
end
