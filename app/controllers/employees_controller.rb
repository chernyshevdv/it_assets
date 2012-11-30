class EmployeesController < ApplicationController
	before_filter :correct_user

	def show
		@user = Employee.find(params[:id])
	end

private

	def correct_user
		@user = Employee.find(params[:id])
		redirect_to '/login' unless current_user?(@user)
	end

end