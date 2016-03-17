class Event < ActiveRecord::Base
	validates_presence_of :name
	has_many :event_groups
	has_many :groups, :through => :event_groups
	has_many :attendees		
	has_one :location
	accepts_nested_attributes_for :location, :allow_destroy => true, :reject_if => :all_blank	
	belongs_to :category
#delegate make @event.category_name is available	
	delegate :name, :to => :category, :prefix => true, :allow_nil => true

#	belongs_to :user
	has_many :memberships
	has_many :users, :through => :memberships
end
