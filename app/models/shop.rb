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
  	records << getAPsRecord << getRoutersRecord << getServerRecord << getVisitCounterRecord << getPrinterZebraRecord << getFaxRecord
  	records << getTCDRecord << getBarcodeScanerRecord
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
  	getRecord(AssetsHelper::EXPENSE_TYPES[:Switch], 2)
  end

  def getAPsRecord
    getRecord(AssetsHelper::EXPENSE_TYPES[:WiFi], 1)
  end

  def getRoutersRecord
    getRecord(AssetsHelper::EXPENSE_TYPES[:Router], 1)
  end

  def getServerRecord
  	getRecord(AssetsHelper::EXPENSE_TYPES[:Server], 1)
  end

  def getVisitCounterRecord
  	getRecord(AssetsHelper::EXPENSE_TYPES[:VisitCounter], 1)
  end

  def getPrinterZebraRecord
  	getRecord(AssetsHelper::EXPENSE_TYPES[:PrinterZebra], 1)
  end

  def getFaxRecord
  	getRecord(AssetsHelper::EXPENSE_TYPES[:Fax], 1)
  end

  def getTCDRecord
  	getRecord(AssetsHelper::EXPENSE_TYPES[:TCD], 1)
  end  

  def getBarcodeScanerRecord
  	getRecord(AssetsHelper::EXPENSE_TYPES[:BarcodeScaner], posCount)
  end  

private
  def getRecord(expenseType, norm)
    record = {
      expense: ExpenseType.find(expenseType),
      norm: norm,
      fact: getAssetCountByExpenseType(expenseType)
    }
end


end
