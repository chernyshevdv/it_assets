#encoding: utf-8
class Employee < ActiveRecord::Base
	self.table_name_prefix = 'dbo.'
	self.table_name = 'refEmployees'
	self.primary_key = "id"
	has_secure_password

	attr_accessible :id, :name, :cfo_id, :extension, :password, :password_confirmation

	belongs_to :department, foreign_key: 'cfo_id'
	has_many :order_customers, foreign_key: "initiator", conditions: "closed=0"
	has_many :user_actions
	has_many :asset_registers, class_name: 'AssetRegister', foreign_key: 'responsible', conditions: '[current]=1'
	has_many :assets, through: :asset_registers
	has_many :managed_CFOs, class_name: 'EmployeeManagesCfos' # many-to-many table
	has_many :managed_departments, class_name: 'Department', through: :managed_CFOs

	def cfo_orders
		OrderCustomer.where('closed=0 AND cfo_id LIKE ?', "#{cfo_id}%")
	end

	def subordinate_departments
		Department.where("id LIKE ?","#{managed_department.id}%").order('id ASC') unless managed_department.nil?
	end

	def annotated_name
		if extension.nil?
			name
		else
			"<abbr title='Phone: #{extension}'>#{name}</abbr>".html_safe
		end
	end

	# returns :signed_in if authenticated with password
	# returns :password_not_set if password_digest is invalid
	# returns :empty_password if password_digest is nil 
	# return :wrong_password
	def auth(password)
		return :empty_password if password_digest.nil?

		return authenticate(password) ? :signed_in : :wrong_password

	rescue BCrypt::Errors::InvalidHash
		return :password_not_set			
	end
end