class RemoveCartsIdAndCoursesId < ActiveRecord::Migration[6.1]
  def change
    remove_column(:cart_items, :carts_id)
    remove_column(:cart_items, :courses_id)
  end
end
