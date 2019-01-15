class AddIsGuestStatusToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users ,:is_guest, :boolean, default: true, null: false
  end
end
