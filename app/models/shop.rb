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
    getRecord(AssetsHelper::EXPENSE_TYPES[:POS], posCount)
  end

  def getPrintersRecord
    getRecord(AssetsHelper::EXPENSE_TYPES[:Printer], posGroupCount || 0 )
  end

  def getComputersRecord
    getRecord(AssetsHelper::EXPENSE_TYPES[:Computer], (salesManagersCount || 0)+4 )
  end

  def getMFUsRecord
    getRecord(AssetsHelper::EXPENSE_TYPES[:MFU], 2)
  end

  def getPhonesRecord
    getRecord(AssetsHelper::EXPENSE_TYPES[:Phone], (salesManagersCount || 0) + 6)
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
