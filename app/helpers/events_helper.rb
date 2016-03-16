module EventsHelper
	#actions here have the same effect within controller
	#actions here are used to reduce ruby code in View
	#skinny controller+fat model
	def setup_event(event)
		event.build_location unless event.location
		event
	end	
end
