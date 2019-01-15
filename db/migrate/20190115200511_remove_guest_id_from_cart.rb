class RemoveGuestIdFromCart < ActiveRecord::Migration[5.2]
  def change
    remove_column :carts, :guest_id
  end
end
