class OrdersController < ApplicationController

  def show
    @order = Order.find_by(id: params[:id])
  end

  def create
   @order = Order.create(user_id: current_user.id)

   @cartedproduct = CartedProduct.where(user_id: current_user.id, status: "carted")

   @cartedproduct.each do |cartedproduct|
    cartedproduct.update(status: "purchased", order_id: @order.id)
  end

    @order.carted_products.each do |carteditem|


    (:subtotal, :tax, :total)

end

end