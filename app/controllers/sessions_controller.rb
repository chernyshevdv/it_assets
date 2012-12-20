# encoding: utf-8
class SessionsController < ApplicationController
	def new
	end

	def create
		user = Employee.find_by_login(params[:session][:login])
		if user && (user.password_digest.nil? || user.authenticate(params[:session][:password]))
			sign_in user
			if user.password_digest.nil?
				redirect_to edit_employee_path(current_user), notice: t('login.empty_password')
			else
				redirect_to current_user
			end
		else
			redirect_to login_path, alert: t('login.wrong_login_or_password')
		end
	rescue BCrypt::Errors::InvalidHash
		redirect_to login_path, alert: t('login.password_not_set')
	end

	def show
		@user = current_user
	end

	def destroy
		sign_out
		redirect_to login_path
	end
end