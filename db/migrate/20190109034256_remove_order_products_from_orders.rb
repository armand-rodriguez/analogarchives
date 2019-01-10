class RemoveOrderProductsFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :order_products
  end
end
