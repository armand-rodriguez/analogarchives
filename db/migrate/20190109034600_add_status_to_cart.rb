class AddStatusToCart < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :status, :integer, default: 1
  end
end
