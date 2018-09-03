class AddPriceToDocuments < ActiveRecord::Migration[5.2]
  def change
    add_monetize :documents, :price, currency: { present: false }
  end
end
