class LikesController < ApplicationController
	before_action :find_event	
	def create
		if @event.is_user_liked(current_user)
		else
			like=@event.likes.create!(:user=>current_user)
#			like=Like.new(:user=>current_user,:event=>@event)
			like.save
		end
		redirect_to :back
	end
	def destroy
		@event.likes.find_by_user_id(current_user).destroy
		redirect_to :back		

	end
	private
	def find_event
		@event=Event.find(params[:event_id])
	end	
end
