class UserAction < ActiveRecord::Base
	self.table_name = "regUserActionHistory"
	belongs_to :employee

	attr_accessible :action

	after_initialize :init

	def init
		self.stamp ||= Time.now
	end
end