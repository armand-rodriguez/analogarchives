class ChangeGuestUsersToGuest < ActiveRecord::Migration[5.2]
  def change
   rename_table :guest_users, :guests
  end
end
