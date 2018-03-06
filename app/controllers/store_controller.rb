class StoreController < ApplicationController

  def index
    @categories = Category.all.order(:title)
    @items = Item.available_items.order(:title)
  end
  
end
