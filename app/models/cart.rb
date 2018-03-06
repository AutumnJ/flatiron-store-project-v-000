class Cart < ActiveRecord::Base

  has_many :line_items, dependent: :destroy
  has_many :items, through: :line_items
  belongs_to :user

  def total
    total = 0
    self.line_items.each do |line_item|
      total += (line_item.item.price * line_item.quantity)
    end
    total
  end

  def add_item(item_id)
    line_item = LineItem.find_by(item_id: item_id)
    if line_item
      line_item.quantity += 1
      line_item
    else
      new_line_item = LineItem.new(quantity: 1, item_id: item_id, cart_id: self.id)
    end
  end 

  def checkout
    self.line_items.each do |line_item|
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
    end
    self.update(status: "submitted")
    order = Order.new(status: "submitted", user_id: self.user.id, total: total)
    order.save
    user.update(current_cart_id: nil)
    user.save
    order
  end

end
