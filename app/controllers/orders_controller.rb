class OrdersController < ApplicationController

  def show
    if !user_signed_in?
      redirect_to store_path
    else 
      @order = Order.find_by(id: params[:id], user_id: current_user.id)
      if !@order
        redirect_to store_path
      end
    end
  end

end
