class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :knowledge_sharing
      t.integer :passing_difficulty
      t.integer :justice
      t.integer :jokes_level
      t.references :teacher, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
