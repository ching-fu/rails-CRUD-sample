class LikesController < ApplicationController
	before_action :find_event	
	def create
		if @event.is_user_liked(current_user)
		else
			@like=@event.likes.create!(:user=>current_user)
#			like=Like.new(:user=>current_user,:event=>@event)
			@like.save
		end
		respond_to do |format|
			format.html { redirect_to :back }
			format.js { render "like" }#direct to like.js.erb
		end
	end
	def destroy
		@event.likes.find_by_user_id(current_user).destroy
		@like=nil# make events/_like.html.erb to show Unlike button
		respond_to do |format|
			format.html { redirect_to :back }
			format.js { render "like" }#direct to like.js.erb
		end
	end
	private
	def find_event
		@event=Event.find(params[:event_id])
	end	
end
