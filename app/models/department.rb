# encoding: utf-8
class Department < ActiveRecord::Base
	self.table_name = 'refCFO'

	has_many :asset_registers, foreign_key: 'cfo_id', conditions: '[current]=1'
	has_many :assets, through: :asset_registers
	has_many :stocktakes, class_name: 'AssetStocktakeDocument', foreign_key: 'cfo_id'

	def getAssetFillPercent
		return nil
	end

	def getAssetCountByExpenseType(expense_id)
		self.asset_registers.joins('JOIN refAssets a ON a.serial_no=regAssetLocations.asset_id JOIN refGoods g ON a.model_id=g.id')
			.where("g.expense_id = ? AND regAssetLocations.[current] = ? AND regAssetLocations.status = ?", expense_id, true, 'Эксплуатация').count
	end

	def generateAssetStocktake(employee)
		doc = stocktakes.build()
		doc.responsibleEmployee = employee if employee.instance_of? Employee
		
		doc.save

		asset_registers.each do |ar|
			row = doc.rows.build(document: doc, asset_id: ar.asset_id, status: ar.status, title: ar.asset.title, model_id: ar.asset.model_id)
			row.save
		end

		return doc
	end
end