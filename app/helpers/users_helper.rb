module UsersHelper
	def collapsible_links
		if user_signed_in?
			'home'
		else
			'index'
			
		end
	end
end
