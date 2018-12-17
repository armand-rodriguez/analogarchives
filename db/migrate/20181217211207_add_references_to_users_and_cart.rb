class AddReferencesToUsersAndCart < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :cart_id, :integer, index: true
    add_column :orders, :user_id, :integer, index: true
  end
end
