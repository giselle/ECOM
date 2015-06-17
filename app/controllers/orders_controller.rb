class OrdersController < ApplicationController
  
  def show
    @order = Order.find_by(id: params[:id])
  end

  def create
 Order.create(user_id: current_user.id)

 CartedProducts.where(user_id: current_user.id, status: "carted", )
  end
end
