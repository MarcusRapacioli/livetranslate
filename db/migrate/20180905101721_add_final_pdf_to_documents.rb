class AddFinalPdfToDocuments < ActiveRecord::Migration[5.2]
  def change
    add_column :documents, :final_pdf, :string
  end
end
