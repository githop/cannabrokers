class MerchantsController < ApplicationController
	before_action :authenticate_user!, only: [:index, :new, :create, :update, :edit]

	def index
		authorize User
		@merchants = Merchant.all
	end

	def show
		@merchant = Merchant.find(params[:id])
	end

	def edibles
		@merchants = Merchant.active_edible_companies
	end

	def concentrates
		@merchants = Merchant.active_concentrate_companies
	end

	def new
		authorize User
		@merchant = Merchant.new
	end

	def create
		authorize User
		@merchant = Merchant.new(merch_params)
		if @merchant.save
			redirect_to @merchant
		else
			render 'new'
		end
	end

	def edit
		authorize User
		@merchant = Merchant.find(params[:id])
	end

	def update
		authorize User
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
