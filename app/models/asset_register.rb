class AssetRegister < ActiveRecord::Base
	self.table_name = "regAssetLocations"
	self.primary_key = [:asset_id, :stamp]

	belongs_to :asset
	belongs_to :department, foreign_key: 'cfo_id'
	belongs_to :employee, foreign_key: 'responsible'
	belongs_to :location
end