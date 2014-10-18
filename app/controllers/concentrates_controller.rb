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

	def edit
		authorize Concentrate
		@concentrate = Concentrate.find(params[:id])
		@merchant = Merchant.find(params[:merchant_id])
	end

	def update
		@concentrate = Concentrate.find(params[:id])
		if @concentrate.update(concentrate_params)
			redirect_to merchant_concentrate_path(Merchant.find(params[:merchant_id]), @concentrate)
		else
			render 'edit'
		end
	end

	private

	def concentrate_params
		params.require(:concentrate).permit(:kind, :strain, :quantity_price, :fees)
	end
end
