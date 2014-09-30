class ConcentratesController < ApplicationController
	def index
		@merchant = Merchant.find(params[:merchant_id])
	end

	def show
		@concentrate = Concentrate.find(params[:id])
	end
end
