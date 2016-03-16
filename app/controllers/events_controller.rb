class EventsController < ApplicationController

	before_action :set_event, :only => [:show,:edit,:update,:destroy]

#GET /events/index
#GET /events
	def index
  		#@events = Event.all
		@events = Event.page(params[:page]).per(5)#for kaminari

		Rails.logger.debug("this is Rails.logger!!")
		Rails.logger.debug("richardyu": + @events.count)		

		respond_to do |format|
			format.html #index.html.erb
			format.xml {
				render :xml => @events.to_xml
			}
			format.json {
				render :json => @events.to_json
			}
			format.atom {
				@feed_title = "My event list"
			}# atom should use index.atom.builder!!
		end	
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
		respond_to do |format|
			format.html { @page_title = @event.name } # show.html.erb
			format.xml # template: show.xml.builder	
			format.json { 
				#manual list
				render :json => { id: @event.id, name: @event.name, created_time: @event.created_at }.to_json 
			}
		end
	end
#POST /events/create
#POST /events <= RESTful	
	def create
	#for Strong Parameters		
		@event = Event.new(event_params)
		if @event.save
			flash[:notice] = "event was successfully created"
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
			flash[:notice] = "event was successfully updated"			
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
		flash[:alert] = "event was successfully deleted"		
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
  		params.require(:event).permit(:name, :description, :category_id, :group_ids => [], :location_attributes =>
[:id, :name, :_destroy])
  	#_destory is related to all_destroy in accepts_nested_attributes_for in event.rb 
	end

end
