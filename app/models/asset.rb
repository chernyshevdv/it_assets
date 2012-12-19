class Asset < ActiveRecord::Base
	self.table_name = "refAssets"
	self.primary_key = "serial_no"

	has_one :article, foreign_key: "model_id"
	has_many :asset_registers
end