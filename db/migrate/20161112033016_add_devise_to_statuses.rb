class AddDeviseToStatuses < ActiveRecord::Migration[5.0]
  def change
    add_column :statuses, :userid, :integer
    add_index :statuses, :userid
    remove_column :statuses, :name
  end
end
