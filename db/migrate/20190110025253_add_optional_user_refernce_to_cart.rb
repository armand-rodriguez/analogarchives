class AddOptionalUserRefernceToCart < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :user_id, :integer, index: true
  end
end
