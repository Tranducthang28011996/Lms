class AddCourseReferencesToLessons < ActiveRecord::Migration[5.0]
  def change
    add_reference :lessons, :course, foreign_key: true
  end
end
