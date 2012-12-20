# encoding: utf-8
class Contract < ActiveRecord::Base
  # attr_accessible :title, :body
  self.table_name = 'refContracts'

  belongs_to :contractor
  has_many :payment_requests

  def annotated_title
  	"#{title} №#{contractNo} (#{contractor.title})"
  end
end
