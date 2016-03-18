class Admin::EventsController < ApplicationController
	before_action :authenticate_user!
	before_action :check_admin	
#	before_action :authenticate	
	layout "admin"
	def index
		@events = Event.all
	end

	protected
	def check_admin
		unless current_user.admin?
			raise ActiveRecord::RecordNotFound
#			flash[:alert]="No permission!!"
#			redirect_to root_path
#			return
		end
	end

	def authenticate
		authenticate_or_request_with_http_basic do |user_name, password|
			user_name == "username" && password =="password"
		end
	end	
end
