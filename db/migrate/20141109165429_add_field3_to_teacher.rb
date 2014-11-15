class AddField3ToTeacher < ActiveRecord::Migration
  def change
    add_column :teachers, :justice, :float
  end
end
