# encoding: utf-8
class SessionsController < ApplicationController
	def new
	end

	def create
		user = Employee.find_by_login(params[:session][:login])
		if user && (user.password_digest.nil? || user.authenticate(params[:session][:password]))
			sign_in user
			if user.password_digest.nil?
				flash[:notice] = 'Ваш пароль пуст! Это очень нехорошо. Настройте свой пароль!' 
				redirect_to edit_employee_path(current_user)
			else
				redirect_to current_user
			end
		else
			flash[:error] = 'Неверная пара "логин-пароль".'
			redirect_to login_path
		end
	rescue BCrypt::Errors::InvalidHash
		flash[:error] = 'Ваш пароль не установлен. Обратитесь к менеджеру по снабжению по телефону 1055!'
		redirect_to login_path
	end

	def show
		@user = current_user
	end

	def destroy
		sign_out
		redirect_to login_path
	end
end