class AssetsController < ApplicationController
	before_filter :load_parents

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
  	@department = Department.find(params[:department_id]) unless params[:department_id].nil?
  	@parent = @employee.nil? ? @department : @employee
  end
end
