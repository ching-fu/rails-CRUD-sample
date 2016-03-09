class EventsController < ApplicationController

	before_action :set_event, :only => [:show,:edit,:update,:destroy]

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
#		@event = Event.find(params[:id])
		@page_title = @event.name

	end
#POST /events/create
#POST /events <= RESTful	
	def create
	#for Strong Parameters		
		@event = Event.new(event_params)
		if @event.save
#			redirect_to :action => :index
			redirect_to events_path #RESTful
		else
			#if can't save, ex. no name, this will direct to new.html.erb
			render :action => :new #new.html.erb
		end		
	end
#GET /events/edit/:id
#GET /events/:id/edit <= RESTful	
	def edit
#		@event = Event.find(params[:id])
	end
#POST /events/update/:id
#PATCH /events/:id <= RESTful
	def update
#		@event = Event.find(params[:id])
		if @event.update(event_params)
			#ask client to require /events/show/:id
#			redirect_to :action => :show, :id => @event
			redirect_to events_path #RESTful
		else
#			redirect_to edit_event_path(@event) #RESTful
			#if can't save, ex. no name, this will direct to new.html.erb
			render :action => :new #new.html.erb
		end		

	end
#GET /events/destroy/:id
#DELETE /events/:id <= RESTful
	def destroy
#		@event = Event.find(params[:id])
		@event.destroy
#		redirect_to :action => :index
		redirect_to events_path #RESTful	
	end

	def set_event
		@event = Event.find(params[:id])
	end

	private
	#for Strong Parameters
	#to read :name & :description from params[:event]
	def event_params
  		params.require(:event).permit(:name, :description)
	end

end
