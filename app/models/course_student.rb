class CourseStudent < ApplicationRecord
  belongs_to :course
  belongs_to :student, class_name: 'User', foreign_key: :student_id

  enum status: [:pending, :approved]

  validates :course_id, uniqueness: { scope: :student_id }
end
