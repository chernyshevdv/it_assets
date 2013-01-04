class DepartmentsController < ApplicationController
	def show
		dept = Department.find(params[:id])
		if dept.instance_of?(Shop)
			@shop = dept
			render 'shops/show'
		else
			@department = dept
			render 'departments/show'
		end
	end
end
