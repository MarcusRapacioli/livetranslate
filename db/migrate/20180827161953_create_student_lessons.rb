class CreateStudentLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :student_lessons do |t|
      t.references :user, foreign_key: true
      t.references :lesson, foreign_key: true
    end
  end
end
