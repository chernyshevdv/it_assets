class Employee < ActiveRecord::Base
	self.table_name_prefix = 'dbo.'
	self.table_name = 'refEmployees'
	self.primary_key = "id"
	has_secure_password

	attr_accessible :id, :name, :cfo_id, :extension, :password, :password_confirmation

	has_many :order_customers, foreign_key: "initiator", conditions: "closed=0"
	has_many :user_actions

	def cfo_orders
		OrderCustomer.where('closed=0 AND cfo_id LIKE ?', "#{cfo_id}%")
	end

	def annotated_name
		if extension.nil?
			name
		else
			"<abbr title='Phone: #{extension}'>#{name}</abbr>".html_safe
		end
	end
end