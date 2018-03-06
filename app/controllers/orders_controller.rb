class OrdersController < ApplicationController

  def show
    @order = Order.find_by(id: params[:id], user_id: current_user.id)
    if !@order
      redirect_to store_path
    end
  end

end
