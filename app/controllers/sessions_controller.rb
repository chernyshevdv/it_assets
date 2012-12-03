class SessionsController < ApplicationController
	def new
	end

	def create
		user = Employee.find_by_login(params[:session][:login])
		if user && (user.password_digest.nil? || user.authenticate(params[:session][:password]))
			sign_in user
			redirect_to current_user
		else
			flash[:error] = 'Login or password is incorrect.'
			redirect_to login_path
		end
	end

	def show
		@user = current_user
	end

	def destroy
		sign_out
		redirect_to login_path
	end
end