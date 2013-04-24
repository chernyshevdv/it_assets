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
			stocktake = dept.generateAssetStocktake(current_user)

			redirect_to [:edit, dept, stocktake]
		else
			redirect_to dept
		end
	end

	def edit
		@document = AssetStocktakeDocument.find(params[:id])
	end

	def print
		@act = 'print'
		show()
	end
end
