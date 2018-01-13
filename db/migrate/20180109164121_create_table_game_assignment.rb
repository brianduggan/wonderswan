class CreateTableGameAssignment < ActiveRecord::Migration
  def change
    create_table :game_assignments do |t|
      t.references :game, index: true, foreign_key: true
      t.references :collection, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
