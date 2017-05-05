class AddStatusToCourseStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :course_students, :status, :integer, default: 0
  end
end
