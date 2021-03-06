class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items
  
  enum cart_type: [:buy_now, :buy_next_time]

  def total_price
    cart_items.reduce(0){|sum, item| sum + item.price}
  end
end
