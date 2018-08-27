class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :documents
  has_many :sections
  has_many :student_lessons
  has_many :attended_lessons, through: :student_lessons, source: :student
  # has_many :taught_lessons

end
