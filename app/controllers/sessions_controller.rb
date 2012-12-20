# encoding: utf-8
class SessionsController < ApplicationController
	def new
	end

	def create
		user = Employee.find_by_login(params[:session][:login])
		return redirect_to login_path, alert: t('login.wrong_password') if user.nil?

		auth = user.auth(params[:session][:password])
		sign_in user if [:empty_password, :password_not_set, :signed_in].include?(auth)

		return redirect_to login_path, notice: t("login.#{auth}") if [:wrong_password, :password_not_set].include?(auth)
		return redirect_to edit_employee_path(current_user), notice: t('login.empty_password') if auth == :empty_password
		return redirect_to current_user if auth == :signed_in
	end

	def show
		@user = current_user
	end

	def destroy
		sign_out
		redirect_to login_path
	end
end