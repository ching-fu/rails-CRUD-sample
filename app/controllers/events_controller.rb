class EventsController < ApplicationController
#GET /events/index
#GET /events
	def index
  		@events = Event.all
	end
#GET /events/new
	def new
  		@event = Event.new
	end

#GET /events/show/:id
#GET /events/:id <= RESTful	
	def show
		@event = Event.find(params[:id])
		@page_title = @event.name

	end
#POST /events/create
#POST /events <= RESTful	
	def create
	#for Strong Parameters		
		@event = Event.new(event_params)
		@event.save
#		redirect_to :action => :index
		redirect_to events_path #RESTful		
	end
#GET /events/edit/:id
#GET /events/:id/edit <= RESTful	
	def edit
		@event = Event.find(params[:id])
	end
#POST /events/update/:id
#PATCH /events/:id <= RESTful
	def update
		@event = Event.find(params[:id])
		@event.update(event_params)
		#ask client to require /events/show/:id
#		redirect_to :action => :show, :id => @event

		redirect_to events_path #RESTful
	end
#GET /events/destroy/:id
#DELETE /events/:id <= RESTful
	def destroy
		@event = Event.find(params[:id])
		@event.destroy
#		redirect_to :action => :index
		redirect_to events_path #RESTful	
	end

	private
	#for Strong Parameters
	#to read :name & :description from params[:event]
	def event_params
  		params.require(:event).permit(:name, :description)
	end

end
