# encoding: utf-8
class AssetsController < ApplicationController
	before_filter :load_parents
	before_filter :correct_user

	def index
		if !@employee.nil?
			@assetRegisters = @employee.asset_registers.paginate(:page => params[:page])
		end
		if !@department.nil?
			@assetRegisters = @department.asset_registers.paginate(:page => params[:page])
		end
	end

	def show
	end

private
  def load_parents
  	@employee = Employee.find(params[:employee_id]) unless params[:employee_id].nil?
  	# We can come here via DeparmentsController or ShopsController
  	if params[:department_id].nil? 
  		@department = Department.find(params[:shop_id]) unless params[:shop_id].nil?
  	else
  		@department = Department.find(params[:department_id])
  	end

  	@parent = @employee.nil? ? @department : @employee
  end

  def correct_user
  	if !current_user?(@employee) && current_user.department != @department && !current_user.subordinate_departments.include?(@department)
  		redirect_to current_user, notice: 'Сотрудник может видеть только свои активы или активы своего подразделения!'
  	end
  end
end
