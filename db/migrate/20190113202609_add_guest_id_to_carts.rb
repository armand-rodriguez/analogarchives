class AddGuestIdToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :guest_id, :integer, index: true
  end
end
