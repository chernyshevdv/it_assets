class Accept < ActiveRecord::Base
	self.table_name = 'tblAccepts'

	has_many :order_rows, foreign_key: "accept_id", class_name: "OrderRow"
end