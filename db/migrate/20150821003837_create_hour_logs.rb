class CreateHourLogs < ActiveRecord::Migration
  def change
    create_table :hour_logs do |t|
      t.string :assignment
      t.string :hours
      t.string :supervisor
      t.string :date
      t.string :status
      t.references :User
      t.timestamps
    end
  end
end
