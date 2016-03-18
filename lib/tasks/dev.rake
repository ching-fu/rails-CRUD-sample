namespace :dev do
	task :demo => :environment do
		#should load environment for read Event
		puts "rake demo"
		puts Event.count
	end

	task :fake => :environment do
		User.delete_all
		Event.delete_all
		Attendee.delete_all

		puts "Creating fake data!!"
		user = User.create!(:email => "afu@hotmail.com", :password => "aaaaaaaa")
		100.times do |i|
			e=Event.create(:name => Faker::App.name)
			100.times do |j|
				e.attendees.create(:name => Faker::Name.name)
			end
		end
		puts "fake data generated!!"		
	end	
end