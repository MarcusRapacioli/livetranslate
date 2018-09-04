class PaymentsController < ApplicationController
  before_action :set_order
  # after_action :update_document_status, only: [ :create ]

  def new
  end

  def create
    customer = Stripe::Customer.create(
    source: params[:stripeToken],
    email:  params[:stripeEmail]
  )

  charge = Stripe::Charge.create(
    customer:     customer.id,   # You should store this customer id and re-use it.
    amount:       @order.amount_cents,
    description:  "Payment for document (title) for order #{@order.id}",
    currency:     @order.amount.currency
  )

  if @order.update(payment: charge.to_json, state: 'paid')
    doc = @order.document
    doc.student_content = "paid"
    doc.save!
  end

  redirect_to order_path(@order)

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_order_payment_path(@order)
  end

private

  def set_order
    @order = current_user.orders.where(state: 'pending').find(params[:order_id])
  end
end
