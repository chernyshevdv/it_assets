class Employee < ActiveRecord::Base
	self.table_name_prefix = 'dbo.'
	self.table_name = 'refEmployees'
	self.primary_key = "id"

	attr_accessible :id, :name, :cfo_id

	has_many :order_customers, foreign_key: "initiator", conditions: "closed=0"

	def cfo_orders
		OrderCustomer.where('closed=0 AND cfo_id LIKE ?', "#{cfo_id}%")
	end
end