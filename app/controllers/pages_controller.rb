class PagesController < ApplicationController
	before_action :logged_in_redirect

	def logged_in_redirect
		if user_signed_in?
			redirect_to problems_path
		end
	end
	
end
