class Employee < ActiveRecord::Base
	self.table_name_prefix = 'dbo.'
	self.table_name = 'refEmployees'
	self.primary_key = "id"

	attr_accessible :id, :name, :cfo_id

	has_many :order_customers, foreign_key: "initiator", conditions: "closed=0"
end