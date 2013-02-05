class EmployeeManagesCfos < ActiveRecord::Base
  self.table_name = 'tblEmployeesManageCFOs'
  self.primary_key = [:employee_id, :cfo_id]

  belongs_to :managing_employee, class_name: 'Employee'
  belongs_to :managed_department, class_name: 'Department', foreign_key: 'cfo_id'
end
