class OrderCustomer < ActiveRecord::Base
	self.table_name = 'tblOrdersCustomer'

	has_many :order_rows, foreign_key: "orderCustomer_id", class_name: "OrderRow"
	belongs_to :manager, class_name: "Employee"
	belongs_to :department, foreign_key: "cfo_id", class_name: "Department"
	belongs_to :initiator, class_name: "Employee", foreign_key: "initiator"

	default_scope order: 'id DESC'

	def total
		accum = 0.0
		order_rows.each do |row|
			accum += (row.price || 0) * (row.quantity || 0)
		end
		accum
	end
end