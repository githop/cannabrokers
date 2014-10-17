class MerchantsController < ApplicationController

	def show
		@merchant = Merchant.find(params[:id])
	end

	def edibles
		@merchants = Merchant.includes(:edibles).order('premium DESC').each_with_object([]) {|m, a| m.edibles.any? ? a << m : false }
	end

	def concentrates
		@merchants = Merchant.includes(:concentrates).order('premium DESC').each_with_object([]) {|m, a| m.concentrates.any? ? a << m : false }
	end

	def new
		@merchant = Merchant.new
	end

	def create
		@merchant = Merchant.new(merch_params)
		if @merchant.save
			redirect_to merchant_path(@merchant)
		end
	end

	private

	def merch_params
		params.require(:merchant).permit(:name, :description, :phone, :email, :premium)
	end
end
