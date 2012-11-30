class OrderCustomersController < ApplicationController
	def show
		@order = OrderCustomer.find(params[:id])
	end
end