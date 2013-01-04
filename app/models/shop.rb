class Shop < Department
  attr_accessible :posCount, :posGroupCount, :salesManagersCount

  def getAssets
  	records = []
  	records << getPOSesRecord << getPrintersRecord << getComputersRecord << getMFUsRecord << getPhonesRecord << getSwitchesRecord 
  	records << getAPsRecord << getRoutersRecord
  end

  def getPOSesRecord
  	record = { expense: ExpenseType.find('5.3.1.1.X1'), norm: posCount, fact: getAssetCountByExpenseType('5.3.1.1.X1') }
  end

  def getPrintersRecord
  	record = { expense: ExpenseType.find('5.3.1.2.X11'), norm: posGroupCount, fact: getAssetCountByExpenseType('5.3.1.2.X11') }
  end

  def getComputersRecord
  	record = { expense: ExpenseType.find('5.3.1.2.X04'), norm: salesManagersCount+4, fact: getAssetCountByExpenseType('5.3.1.2.X04') }
  end

  def getMFUsRecord
  	record = { expense: ExpenseType.find('5.3.1.2.X07'), norm: 2, fact: getAssetCountByExpenseType('5.3.1.2.X07') }
  end

  def getPhonesRecord
  	record = { expense: ExpenseType.find('5.3.1.2.X18'), norm: salesManagersCount+6, fact: getAssetCountByExpenseType('5.3.1.2.X18') }
  end

  def getSwitchesRecord
  	record = { expense: ExpenseType.find('5.3.1.2.X02.Z01'), norm: 2, fact: getAssetCountByExpenseType('5.3.1.2.X02.Z01') }
  end

  def getAPsRecord
  	record = { expense: ExpenseType.find('5.3.1.2.X02.Z02'), norm: 1, fact: getAssetCountByExpenseType('5.3.1.2.X02.Z02') }
  end

  def getRoutersRecord
  	record = { expense: ExpenseType.find('5.3.1.2.X02.Z03'), norm: 1, fact: getAssetCountByExpenseType('5.3.1.2.X02.Z03') }
  end

  def getAssetCountByExpenseType(expense_id)
  	self.asset_registers.joins('JOIN refAssets a ON a.serial_no=regAssetLocations.asset_id JOIN refGoods g ON a.model_id=g.id')
  		.where("g.expense_id" => expense_id).count
  end
end
