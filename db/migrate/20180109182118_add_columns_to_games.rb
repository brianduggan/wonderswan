class AddColumnsToGames < ActiveRecord::Migration
  def change
    add_column :games, :publisher, :string, :default => 'unknown'
    add_column :games, :developer, :string, :default => 'unknown'
    add_column :games, :japanese_title, :string
    add_column :games, :romaji, :string
  end
end
