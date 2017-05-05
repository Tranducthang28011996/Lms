class Course < ApplicationRecord
  ON_GOING_STATUS = 0
  COMING_STATUS = 1
  PASSED_STATUS = 2

  searchkick searchable: [:name]

  has_many :course_students
  has_many :students, -> { where(role: 'student') }, class_name: 'User', through: :course_students

  has_many :lessons

  mount_uploader :image, ImageUploader

  validates :name, length: { in: 5..30 }

  def total_request
    CourseStudent.where(course_id: id, status: 'pending').count
  end
end
