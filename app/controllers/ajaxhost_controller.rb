class AjaxhostController < ApplicationController
	def ajaxitem

#		render :layout => false
		respond_to do |format|
      		format.html { render :layout => false } # item.html.erb
      		format.json { render :json => { :timenow => Time.now, :name => "give you json" } }#return :title in json
			format.js # ajaxtest.js.erb
    	end
	end
	def index

	end
end
