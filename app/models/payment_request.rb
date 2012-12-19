class PaymentRequest < ActiveRecord::Base
  # attr_accessible :title, :body
  self.table_name = 'tblPaymentRequests'

  belongs_to :initator, class_name: 'Employee', foreign_key: 'initiator'
  belongs_to :implementer, class_name: 'Employee', foreign_key: 'implementer'
  has_many :order_rows, foreign_key: "paymentRequest_id", class_name: "OrderRow"
end
