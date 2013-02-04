class AssetStocktakeDocumentsController < ApplicationController
	def index
		if !params[:shop_id].nil?
			shop = Shop.find(params[:shop_id])
			@documents = AssetStocktakeDocument.where("department_id=#{shop.id}")
		else
			@documents = AssetStocktakeDocument.all()
		end
	end

	def show
		@document = AssetStocktakeDocument.find(params[:id])
	end

	def create
		if !params[:department_id].nil?
			dept = Department.find(params[:department_id])
			stocktake = dept.generateAssetStocktake

			redirect_to [dept, stocktake]
		else
			redirect_to dept
		end
	end
end
