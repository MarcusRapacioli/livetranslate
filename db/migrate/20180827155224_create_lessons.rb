class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.string :lesson_name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
