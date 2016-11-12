class ChangeUseridToUserIdInStatus < ActiveRecord::Migration[5.0]
  def change
    rename_column :statuses, :userid, :user_id
  end
end
