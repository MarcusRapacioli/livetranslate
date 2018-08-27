class Lesson < ApplicationRecord
  belongs_to :teacher, class_name: 'User', foreign_key: 'user_id'
  # has_many :documents
  # belongs_to :student_class
end
