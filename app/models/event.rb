class Event < ActiveRecord::Base
	validates_presence_of :name
	has_many :attendees
	has_one :location
end
