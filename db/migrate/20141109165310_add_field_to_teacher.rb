class AddFieldToTeacher < ActiveRecord::Migration
  def change
    add_column :teachers, :knowledge_sharing, :float
  end
end
