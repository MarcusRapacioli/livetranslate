class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.string :status
      t.text :original_content
      t.text :final_content
      t.references :document, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
