class AddIndexToAttendees < ActiveRecord::Migration
  def change
  	add_index :attendees, :event_id
  end
end
