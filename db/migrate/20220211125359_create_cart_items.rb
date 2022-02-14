class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.belongs_to :carts
      t.belongs_to :courses
      t.timestamps
    end
  end
end
