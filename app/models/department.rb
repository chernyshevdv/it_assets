class Department < ActiveRecord::Base
	self.table_name = 'refCFO'

	has_many :asset_registers, foreign_key: 'cfo_id'
	has_many :assets, through: :asset_registers
end