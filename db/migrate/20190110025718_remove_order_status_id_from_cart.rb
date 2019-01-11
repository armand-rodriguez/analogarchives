class RemoveOrderStatusIdFromCart < ActiveRecord::Migration[5.2]
  def change
    remove_column :carts, :order_status_id
  end
end
