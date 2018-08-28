class Section < ApplicationRecord
  belongs_to :document
  belongs_to :student, class_name: 'User', foreign_key: 'user_id'
end
