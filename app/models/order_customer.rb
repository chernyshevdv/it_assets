class OrderCustomer < ActiveRecord::Base
	self.table_name = 'tblOrdersCustomer'

	has_many :order_rows, foreign_key: "orderCustomer_id", class_name: "OrderRow"
	belongs_to :manager, class_name: "Employee"

	default_scope order: 'id DESC'
end