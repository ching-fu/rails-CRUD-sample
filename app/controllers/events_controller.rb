class EventsController < ApplicationController
	def index
  		@events = Event.all
	end

	def new
  		@event = Event.new
	end
	def show
		@event = Event.find(params[:id])
		@page_title = @event.name

	end

	def create
	#for Strong Parameters		
		@event = Event.new(event_params)
		@event.save
		redirect_to :action => :index
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])
		@event.update(event_params)
		#ask client to require /events/show/:id
		redirect_to :action => :show, :id => @event
	end

	def destroy
		@event = Event.find(params[:id])
		@event.destroy
		redirect_to :action => :index
	end

	private
	#for Strong Parameters
	#to read :name & :description from params[:event]
	def event_params
  		params.require(:event).permit(:name, :description)
	end

end
