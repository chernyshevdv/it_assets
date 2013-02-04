class CreateAssetStocktakeDocuments < ActiveRecord::Migration
  def change
    create_table :asset_stocktake_documents do |t|

      t.timestamps
    end
  end
end
