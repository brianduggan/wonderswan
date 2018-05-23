class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :release_year
      t.string :genres
      t.string :igenres
      t.string :description

      t.timestamps null: false
    end
  end
end
