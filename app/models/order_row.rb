class OrderRow < ActiveRecord::Base
	self.table_name = "tblOrdersRows"
	self.primary_key = "row_id"

	belongs_to :order_customer
	belongs_to :article, foreign_key: "goods_id", class_name: "Article"

	default_scope order: 'row_id ASC'
end