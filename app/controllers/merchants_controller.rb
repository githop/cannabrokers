class MerchantsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :update, :edit]
	def show
		@merchant = Merchant.find(params[:id])
	end

	def edibles
		@merchants = Merchant.edible_companies
	end

	def concentrates
		@merchants = Merchant.concentrate_companies
	end

	def new
		authorize Merchant
		@merchant = Merchant.new
	end

	def create
		authorize Merchant
		@merchant = Merchant.new(merch_params)
		if @merchant.save
			redirect_to merchant_path(@merchant)
		end
	end

	def edit
		authorize Merchant
		@merchant = Merchant.find(params[:id])
	end

	def update
		authorize Merchant
		@merchant = Merchant.find(params[:id])
		if @merchant.update(merch_params)
			redirect_to @merchant
		else
			render 'edit'
		end
	end

	private

	def merch_params
		params.require(:merchant).permit(:name, :description, :phone, :email, :premium)
	end
end
