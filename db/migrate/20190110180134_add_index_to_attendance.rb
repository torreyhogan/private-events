class AddIndexToAttendance < ActiveRecord::Migration[5.2]
  def change
  	add_index :attendances, :user
  	add_index :attendances, :event
  end
end
