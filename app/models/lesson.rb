class Lesson < ApplicationRecord
  belongs_to :teacher, class_name: 'User', foreign_key: 'user_id'
  has_many :documents
  has_many :student_lessons
  has_many :students, through: :student_lessons, source: :student

  def name
    lesson_name
  end
end
