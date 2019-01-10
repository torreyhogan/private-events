class RemoveExtraIndexFromAttendance < ActiveRecord::Migration[5.2]
  def change
  	remove_index :attendances, name: :index_attendances_on_event
  	remove_index :attendances, name: :index_attendances_on_user
  end
end
