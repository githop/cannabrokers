class ConcentratesController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create]

	def index
		@merchant = Merchant.find(params[:merchant_id])
	end

	def show
		
		@concentrate = Concentrate.find(params[:id])
	end

	def new
		authorize Concentrate
		@merchant = Merchant.find(params[:merchant_id])
		@concentrate = Concentrate.new
	end

	def create
		authorize Concentrate
		merchant = Merchant.find(params[:merchant_id])
		@concentrate = Concentrate.new(concentrate_params)
		if @concentrate.save
			merchant.concentrates << @concentrate
			redirect_to merchant_concentrate_path(merchant, @concentrate)
		end
	end

	private

	def concentrate_params
		params.require(:concentrate).permit(:kind, :strain, :quantity_price, :fees)
	end
end
