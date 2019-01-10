class DropCartStatuses < ActiveRecord::Migration[5.2]
  def up
    drop_table :cart_statuses
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
