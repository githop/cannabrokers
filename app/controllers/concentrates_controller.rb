class ConcentratesController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :edit, :update]

	def index
		@merchant = Merchant.find(params[:merchant_id])
	end

	def all
		@merchant = Merchant.find(params[:merchant_id])
	end

	def show
		@concentrate = Concentrate.find(params[:id])
	end

	def new
		authorize User
		@merchant = Merchant.find(params[:merchant_id])
		@concentrate = Concentrate.new
	end

	def create
		authorize User
		@merchant = Merchant.find(params[:merchant_id])
		@concentrate = Concentrate.new(concentrate_params)
		if @concentrate.save
			@merchant.concentrates << @concentrate
			redirect_to merchant_concentrate_path(@merchant, @concentrate)
		else
			render 'new'
		end
	end

	def edit
		authorize User
		@concentrate = Concentrate.find(params[:id])
		@merchant = Merchant.find(params[:merchant_id])
	end

	def update
		authorize User
		@concentrate = Concentrate.find(params[:id])
		@merchant = Merchant.find(params[:merchant_id])
		if @concentrate.update(concentrate_params)
			redirect_to merchant_concentrate_path(@merchant, @concentrate)
		else
			render 'edit'
		end
	end

	private

	def concentrate_params
		params.require(:concentrate).permit(:kind, :strain, :quantity_price, :fees, :display)
	end
end
