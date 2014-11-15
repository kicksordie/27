class AddField4ToTeacher < ActiveRecord::Migration
  def change
    add_column :teachers, :jokes_level, :float
  end
end
