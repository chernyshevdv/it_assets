require 'assets_helper'

class Shop < Department
  attr_accessible :posCount, :posGroupCount, :salesManagersCount

  	def getAssetFillPercent
		fill = 0.0
		assetCount = 0
		getAssetFill.each do |asset|
			assetCount += 1
			fill += asset[:fact].to_f / asset[:norm].to_f
		end
		return assetCount > 0 ? fill / assetCount : 0
	end

  def getAssetFill
  	records = []
  	records << getPOSesRecord << getPrintersRecord << getComputersRecord << getMFUsRecord << getPhonesRecord << getSwitchesRecord 
  	records << getAPsRecord << getRoutersRecord
  end

  def getPOSesRecord
  	record = { 
  		expense: ExpenseType.find(AssetsHelper::EXPENSE_TYPES[:POS]), 
  		norm: posCount, 
  		fact: getAssetCountByExpenseType(AssetsHelper::EXPENSE_TYPES[:POS]) 
  	}
  end

  def getPrintersRecord
  	record = { 
  		expense: ExpenseType.find(AssetsHelper::EXPENSE_TYPES[:Printer]), 
  		norm: posGroupCount, 
  		fact: getAssetCountByExpenseType(AssetsHelper::EXPENSE_TYPES[:Printer]) 
  	}
  end

  def getComputersRecord
  	record = { 
		expense: ExpenseType.find(AssetsHelper::EXPENSE_TYPES[:Computer]), 
		norm: (salesManagersCount || 0) +4, 
		fact: getAssetCountByExpenseType(AssetsHelper::EXPENSE_TYPES[:Computer]) 
	}
  end

  def getMFUsRecord
  	record = { 
		expense: ExpenseType.find(AssetsHelper::EXPENSE_TYPES[:MFU]), 
		norm: 2, 
		fact: getAssetCountByExpenseType(AssetsHelper::EXPENSE_TYPES[:MFU]) 
	}
  end

  def getPhonesRecord
  	record = { 
		expense: ExpenseType.find(AssetsHelper::EXPENSE_TYPES[:Phone]), 
		norm: (salesManagersCount || 0)+6, 
		fact: getAssetCountByExpenseType(AssetsHelper::EXPENSE_TYPES[:Phone]) 
}
  end

  def getSwitchesRecord
  	record = { 
  		expense: ExpenseType.find(AssetsHelper::EXPENSE_TYPES[:Switch]), 
  		norm: 2, 
  		fact: getAssetCountByExpenseType(AssetsHelper::EXPENSE_TYPES[:Switch]) 
  	}
  end

  def getAPsRecord
  	record = { 
  		expense: ExpenseType.find(AssetsHelper::EXPENSE_TYPES[:WiFi]), 
  		norm: 1, 
  		fact: getAssetCountByExpenseType(AssetsHelper::EXPENSE_TYPES[:WiFi]) 
  	}
  end

  def getRoutersRecord
  	record = { 
  		expense: ExpenseType.find(AssetsHelper::EXPENSE_TYPES[:Router]), 
  		norm: 1, 
  		fact: getAssetCountByExpenseType(AssetsHelper::EXPENSE_TYPES[:Router]) 
  	}
  end
end
