class EmployeesController < ApplicationController
	before_filter :correct_user

	def show
		@user = Employee.find(params[:id])
		orders = params[:orders]
		case orders
		when 'my'
			render 'my_orders'
		when 'cfo'
			render 'cfo_orders'
		else
			render 'my_orders'
		end
	end

private

	def correct_user
		@user = Employee.find(params[:id])
		redirect_to root_path unless current_user?(@user)
	end

end