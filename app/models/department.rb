class Department < ActiveRecord::Base
	self.table_name = 'refCFO'

	has_many :asset_registers, foreign_key: 'cfo_id', conditions: '[current]=1'
	has_many :assets, through: :asset_registers
end