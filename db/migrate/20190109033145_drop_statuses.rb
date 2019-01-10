class DropStatuses < ActiveRecord::Migration[5.2]
  def up
    drop_table :statuses
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
