class AddDocumentToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :document, index: true
  end
end
