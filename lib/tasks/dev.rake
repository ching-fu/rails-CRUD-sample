namespace :dev do
	task :demo => :environment do
		#should load environment for read Event
		puts "rake demo"
		puts Event.count
	end

end