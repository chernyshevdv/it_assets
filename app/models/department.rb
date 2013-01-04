class Department < ActiveRecord::Base
	self.table_name = 'refCFO'

	has_many :asset_registers, foreign_key: 'cfo_id', conditions: '[current]=1'
	has_many :assets, through: :asset_registers

	def getAssetFillPercent
		return nil
	end

	def getAssetCountByExpenseType(expense_id)
		self.asset_registers.joins('JOIN refAssets a ON a.serial_no=regAssetLocations.asset_id JOIN refGoods g ON a.model_id=g.id')
			.where("g.expense_id" => expense_id).count
	end
end