# encoding: utf-8
class SessionsController < ApplicationController
	def new
	end

	def create
		user = Employee.find_by_login(params[:session][:login])
		return redirect_to login_path, alert: t('login.wrong_login_or_password') if user.nil?

		auth = user.auth(params[:session][:password])
		sign_in user if [:empty_password, :password_not_set, :signed_in].include?(auth)

		case auth
		when :wrong_password
			redirect_to login_path, alert: t('login.wrong_login_or_password')
		when :empty_password
			redirect_to edit_employee_path(current_user), notice: t('login.empty_password')
		when :password_not_set
			redirect_to login_path, notice: t('login.password_not_set')
		when :signed_in
			redirect_to current_user
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