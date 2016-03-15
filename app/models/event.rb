class Event < ActiveRecord::Base
	validates_presence_of :name
	has_many :event_groups
	has_many :groups, :through => :event_groups
	has_many :attendees		
	has_one :location
	belongs_to :category
#delegate make @event.category_name is available	
	delegate :name, :to => :category, :prefix => true, :allow_nil => true
end
