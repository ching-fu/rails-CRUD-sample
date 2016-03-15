class AddIndexToEventGroups < ActiveRecord::Migration
  def change
  	add_index :event_groups, :event_id
  	add_index :event_groups, :group_id  	
  end
end
