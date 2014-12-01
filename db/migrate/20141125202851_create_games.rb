class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :word, null: false
      t.integer :finished, null: false, default: 0
      t.integer :lives_remaining, null: false, default: 10
      t.timestamps
    end
  end
end
