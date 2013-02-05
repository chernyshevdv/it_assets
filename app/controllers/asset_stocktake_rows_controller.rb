class AssetStocktakeRowsController < ApplicationController
	def destroy
		@row = AssetStocktakeRow.find(params[:id])
		@document = @row.document
		@row.destroy

		respond_to do |format|
			format.html { redirect_to @document }
			format.js
		end
	end

	def update
		@row = AssetStocktakeRow.find(params[:id])
		@row.update_attributes(params[:asset_stocktake_row])

		respond_to do |format|
			format.js
		end
	end

	def create
		@row = AssetStocktakeRow.create!(params[:asset_stocktake_row])
		respond_to do |format|
			format.html { redirect_to [:edit, @row.document] }
			format.js
		end
	end
end
