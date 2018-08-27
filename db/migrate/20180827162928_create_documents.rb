class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
     t.string :title
     t.text :original_content
     t.text :student_content
     t.text :final_content
     t.references :user, foreign_key: true
     t.references :lesson, foreign_key: true
    end
  end
end
