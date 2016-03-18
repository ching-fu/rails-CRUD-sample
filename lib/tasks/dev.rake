namespace :dev do
	#db:setup == db:create + db:schema:load + db:seed
	task :rebuild => ["db:drop","db:setup", :fake]

	task :demo => :environment do
		#should load environment for read Event
		puts "rake demo"
		puts Event.count
	end
	desc "create fake Event & Attendee"
	task :fake => :environment do
		User.delete_all
		Event.delete_all
		Attendee.delete_all

		puts "Creating fake data!!"
		user = User.create!(:email => "afu@hotmail.com", :password => "aaaaaaaa")
		20.times do |i|
			e=Event.create(:name => Faker::App.name)
			20.times do |j|
				e.attendees.create(:name => Faker::Name.name)
			end
		end
		puts "fake data generated!!"		
	end	
end