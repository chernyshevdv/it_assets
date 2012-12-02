class StaticPagesController < ApplicationController
	def index
		if signed_in?
			redirect_to current_user
		else
			redirect_to login_path
		end
	end
end