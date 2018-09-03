class OrdersController < ApplicationController
  def show
    @order = current_user.orders.where(state: 'paid').find(params[:id])
  end

  def create
    document = Document.find(params[:document_id])
    order  = Order.create!(amount: document.price, state: 'pending', user: current_user)

    redirect_to new_order_payment_path(order)
  end
end
