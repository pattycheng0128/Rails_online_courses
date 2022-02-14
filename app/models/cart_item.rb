class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :course
  has_one :user, through: :cart # get cart's user


  def price
    course.price
  end
  
end
