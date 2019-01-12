module UserHelper

	# determines if input user is the currrent user
	def current_user?(user)
		current_user.id == user.id if current_user
	end
end
