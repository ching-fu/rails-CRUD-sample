module LikesHelper
	def event_count_likes(x)
		x.likes.build unless x.likes
		puts 'likes of this event are ====>'+x.likes.all.count.to_s
		x.likes.all.count
	end
end
