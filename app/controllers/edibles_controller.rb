class EdiblesController < ApplicationController
	def index
		@merchant = Merchant.find(params[:merchant_id])
	end

	def show
		@edible = Edible.find(params[:id])
	end
end
