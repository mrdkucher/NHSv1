class Fixcolumn1 < ActiveRecord::Migration
  def change
    rename_column :hour_logs, :User_id, :user_id
  end
end
