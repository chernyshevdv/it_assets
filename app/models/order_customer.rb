class OrderCustomer < ActiveRecord::Base
	self.table_name = 'tblOrdersCustomer'

	has_many :order_rows, foreign_key: "orderCustomer_id", class_name: "OrderRow"

	default_scope order: 'id DESC'
end