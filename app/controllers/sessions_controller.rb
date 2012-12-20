# encoding: utf-8
class SessionsController < ApplicationController
	def new
	end

	def create
		user = Employee.find_by_login(params[:session][:login])
		auth = true if user && user.password_digest.nil?
		auth = user.authenticate(params[:session][:password]) unless user.nil? || user.password_digest.nil?
		sign_in user unless user.nil? || !auth

		redirect_to login_path, alert: t('login.wrong_login_or_password') if !signed_in?
		redirect_to edit_employee_path(current_user), notice: t('login.empty_password') if signed_in? && user.password_digest.nil?
		redirect_to current_user if signed_in? && auth
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