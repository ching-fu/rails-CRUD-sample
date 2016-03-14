class Event < ActiveRecord::Base
	validates_presence_of :name
	has_many :event_groups
	has_many :groups, :through => :event_groups
	has_many :attendees		
	has_one :location	
end
