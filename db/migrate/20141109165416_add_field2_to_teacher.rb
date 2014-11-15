class AddField2ToTeacher < ActiveRecord::Migration
  def change
    add_column :teachers, :passing_difficulty, :float
  end
end
