class AddCartAndCourseInCartItems < ActiveRecord::Migration[6.1]
  def change
    add_reference(:cart_items, :cart)
    add_reference(:cart_items, :course)
  end
end
