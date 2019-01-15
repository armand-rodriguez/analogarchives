class AddCartReferenceToGuestUser < ActiveRecord::Migration[5.2]
  def change
    add_column :guest_users, :cart_id, :integer, index: true
  end
end
