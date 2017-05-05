class CreateCourseStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :course_students do |t|
      t.references :course, foreign_key: true
      t.references :student

      t.timestamps
    end
  end
end
