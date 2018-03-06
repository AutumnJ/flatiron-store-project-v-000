class CartsController < ApplicationController

  def show
    @cart = Cart.find(params[:id])
  end

  def checkout
    cart = Cart.find(params[:id])
    order = cart.checkout
    redirect_to order_path(order)
    # redirect_to cart_path(cart)
  end

end
