class AssetStocktakeDocument < ActiveRecord::Base
  self.table_name = 'docAssetStocktake'

  has_many :rows, class_name: 'AssetStocktakeRow', foreign_key: 'doc_id'
  belongs_to :department
  belongs_to :location
  belongs_to :responsible, class_name: 'Employee', foreign_key: 'responsible'
  belongs_to :approver, class_name: 'Employee', foreign_key: 'approver'

end
