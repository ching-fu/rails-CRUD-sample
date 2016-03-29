namespace :dev do
	#db:setup == db:create + db:schema:load + db:seed
	task :rebuild => ["db:drop","db:setup", :fake]

	task :ubike => :environment do
		Ubike.delete_all
		url = 'http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=ddb80380-f1b3-4f8e-8016-7ed9cba571d5'
		j=RestClient.get(url)
		jj=JSON.parse(j)
		k=jj['result']['results']
		k.each do |i|
			puts i['sna']
			e=Ubike.create!(:name=>i["sna"],:addr=>i['ar'])
		end
#		Ubike.all
		puts "get Ubike data done"
	end
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