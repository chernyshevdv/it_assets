class SupplyOrder < ActiveRecord::Base
  # attr_accessible :title, :body
  self.table_name = 'tblOrdersSupply'

  belongs_to :manager, class_name: 'Employee'
  has_many :order_rows, foreign_key: "orderCustomer_id", class_name: "OrderRow"
end
