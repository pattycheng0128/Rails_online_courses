class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items

  # enum pay_status: [:not_paid, :paid]
  enum pay_status: [:not_pay, :paid]

  def total_price
    # 可以改寫
    amount = 0

    order_items.each do |item|
      amount += item.price
    end

    return amount
  end
end
