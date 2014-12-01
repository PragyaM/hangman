class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.integer :game_id, null: false
      t.string :letter, null: false
      t.timestamps
    end
    
    add_index(:guesses, [:game_id, :letter], unique: true)
  end
end
