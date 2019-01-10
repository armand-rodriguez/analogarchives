class RemoveProductsColumnsFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :products
  end
end
