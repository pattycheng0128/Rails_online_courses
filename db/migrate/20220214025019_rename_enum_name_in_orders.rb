class RenameEnumNameInOrders < ActiveRecord::Migration[6.1]
  def change
    rename_column(:orders, :status, :pay_status)
  end
end
