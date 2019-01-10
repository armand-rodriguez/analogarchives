class DropOrderStatuses < ActiveRecord::Migration[5.2]
  def up
    drop_table :order_statuses
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
