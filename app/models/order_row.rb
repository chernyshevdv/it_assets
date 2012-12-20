class OrderRow < ActiveRecord::Base
	self.table_name = "tblOrdersRows"
	self.primary_key = "row_id"

	belongs_to :order_customer, foreign_key: 'orderCustomer_id'
	belongs_to :supply_order, foreign_key: 'orderSupply_id'
	belongs_to :accept
	belongs_to :payment_request, foreign_key: 'paymentRequest_id'
	belongs_to :article, foreign_key: "goods_id", class_name: "Article"
	belongs_to :department, foreign_key: "cfo_id", class_name: "Department"
	belongs_to :expense_type, foreign_key: 'expense_id'
	belongs_to :importance

	default_scope order: 'importance_id, row_id ASC'
end