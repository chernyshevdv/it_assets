# encoding: utf-8
class PaymentRequestsController < ApplicationController
	def show
		@paymentRequest = PaymentRequest.find(params[:id])
	end

	def search
		dc = PaymentRequest.find(params[:dc])
		redirect_to payment_request_path(dc)
	rescue
		redirect_to current_user, notice: "Заявка #{params[:dc]} не найдена"
	end
end
