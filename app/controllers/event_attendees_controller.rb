class EventAttendeesController < ApplicationController
	before_action :set_event
	def index
		@attendees=@event.attendees.order("id DESC")
	end
	def show
		@attendee=@event.attendees.find(params[:id])
	end
	def new
		puts 'here is new of attendee'
		@attendee=@event.attendees.build		
	end
	def create
		puts 'here is create of attendee'
		if params[:newname]
			puts params[:newname]
			@attendee=@event.attendees.build
			@attendee.name=params[:newname]
		else
			@attendee=@event.attendees.build(attendee_params)	
		end
		if @attendee.save
			respond_to do |format|
      			format.html { redirect_to event_attendees_path(@event) } # item.html.erb
				format.js # create.js.erb
    		end
		else
			render :action => "new"
		end
	end
	def destroy
		@attendee=@event.attendees.find(params[:id])
		@attendee.destroy
		respond_to do |format|
			format.html { redirect_to event_attendees_path(@event) }
			format.js
		end
	end
	def edit
		@attendee=@event.attendees.find(params[:id])
	end
	def update
		@attendee=@event.attendees.find(params[:id])
		if @attendee.update(attendee_params)
			redirect_to event_attendees_path(@event)
		else
			render :action => "edit"
		end
	end
	protected
	def attendee_params
		params.require(:attendee).permit(:name)
	end
	def set_event
		@event =Event.find(params[:event_id])
	end
end
