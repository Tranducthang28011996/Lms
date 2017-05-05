class Lesson < ApplicationRecord
  validates :name, presence: true,
            uniqueness: { scope: :course_id,
                          message: 'cannot have two lessons with same name in a course' }

  validates :document_url, presence: true
                        #  & validate format theo dinh dang url = regular expression

  belongs_to :course
end
