class CreateAssetStocktakeRows < ActiveRecord::Migration
  def change
    create_table :asset_stocktake_rows do |t|

      t.timestamps
    end
  end
end
