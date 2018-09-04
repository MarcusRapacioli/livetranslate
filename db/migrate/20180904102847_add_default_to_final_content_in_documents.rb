class AddDefaultToFinalContentInDocuments < ActiveRecord::Migration[5.2]
  def change
    change_column :documents, :final_content, :text, default: ""
  end
end
