class AddColumnToGames < ActiveRecord::Migration
  def change
    add_column :games, :color, :string, :default => 'No'
  end
end
