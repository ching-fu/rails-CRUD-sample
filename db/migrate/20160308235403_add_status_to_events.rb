class AddStatusToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :status, :string
  	#add column "status", "string" type into db "events" 
  end
end
