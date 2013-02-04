class AssetStocktakeRow < ActiveRecord::Base
  self.table_name = 'rowAssetStocktake'
  attr_accessible :document, :asset_id, :status, :title, :model_id

  belongs_to :document, class_name: 'AssetStocktakeDocument', foreign_key: 'doc_id'
  belongs_to :article, foreign_key: 'model_id'
end
